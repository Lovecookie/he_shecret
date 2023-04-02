import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shipcret/providers/auth/auth_repository.dart';
import 'package:shipcret/providers/dtos/token_dto.dart';
import 'package:shipcret/providers/repository_base.dart';

final shipcretUrl = dotenv.env['SHIPCRET_API_URL'] ?? 'http://10.0.2.2:8000';

/*
  * Dio provider
  */
final authDioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = shipcretUrl;
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.interceptors.add(LogInterceptor(responseBody: true));
  dio.interceptors.add(AuthInterceptor(ref: ref));
  return dio;
});

final contentDioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = shipcretUrl;
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.interceptors.add(LogInterceptor(responseBody: true));
  dio.interceptors.add(TokenInterceptor(ref: ref));
  return dio;
});

/*
 * Interceptor
 */
class AuthInterceptor extends Interceptor {
  final _storage = const FlutterSecureStorage();
  final Ref ref;

  const AuthInterceptor({required this.ref});

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // final String accessToken = response.data?['accessToken'] ?? '';
    // final String refreshToken = response.data?['refreshToken'] ?? '';

    if (response.data != null) {
      if (response.data['data'] != null) {
        final token = response.data['data']['token'];
        if (token != null) {
          final FTokenDto tokenDto = FTokenDto.fromJson(token);
          _storage.write(key: 'AT', value: tokenDto.accessToken);
          _storage.write(key: 'RT', value: tokenDto.refreshToken);
        }
      }
    }

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 200 && err.response?.statusCode != 201) {
      await _storage.delete(key: 'AT');
      await _storage.delete(key: 'RT');
    }

    return handler.next(err);
  }
}

class TokenInterceptor extends Interceptor {
  final _storage = const FlutterSecureStorage();
  final Ref ref;

  const TokenInterceptor({required this.ref});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final at = await _storage.read(key: 'AT');

    options.headers['Authorization'] = 'Bearer $at';
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // final at = await _storage.read(key: 'AT');
      final rt = await _storage.read(key: 'RT');

      try {
        final responseData = await ref.read(FAuthRepository.provider).refreshToken(
              options: Options(
                headers: {'Authorization': 'Bearer $rt'},
              ),
            );

        await _storage.write(key: 'AT', value: responseData.accessToken);
        await _storage.write(key: 'RT', value: responseData.refreshToken);
      } catch (e) {
        await _storage.delete(key: 'AT');
        await _storage.delete(key: 'RT');
      }

      final retryFailedRequest = await ref.read(FAuthRepository.provider).request(
            err.requestOptions.path,
            options: Options(method: err.requestOptions.method, headers: err.requestOptions.headers),
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );

      return handler.resolve(retryFailedRequest);
    }
  }
}

/*
 * Dio Exception
 */
class DioException implements Exception {
  final String message;
  final int? statusCode;
  final FResponseData? responseData;
  final String? statusMessage;

  DioException({
    required this.message,
    this.statusCode,
    this.responseData,
    this.statusMessage,
  });

  @override
  String toString() {
    final dataToString = responseDataToString();
    return 'DioError{ message: $message, statusCode: $statusCode, responseData: {$dataToString} }';
  }

  String responseDataToString() {
    if (responseData != null) {
      return responseData!.getErrorString();
    }

    return 'is null';
  }
}

/*
 * Dio Error Util
 */
class DioErrorUtil {
  static DioException getDioException(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return DioException(message: 'Connection timeout');
      case DioErrorType.sendTimeout:
        return DioException(message: 'Send timeout');
      case DioErrorType.receiveTimeout:
        return DioException(message: 'Receive timeout');
      case DioErrorType.badCertificate:
        return DioException(message: 'Bad certificate');
      case DioErrorType.badResponse:
        return DioException(message: 'Bad response', responseData: FResponseData.fromJson(dioError.response?.data));
      case DioErrorType.cancel:
        return DioException(message: 'Request cancelled');
      case DioErrorType.connectionError:
        return DioException(message: 'Connection error');
      case DioErrorType.unknown:
    }

    return DioException(message: 'Unknown error');
  }
}
