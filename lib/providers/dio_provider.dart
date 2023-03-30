import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  dio.options.baseUrl = dotenv.env['SHIPCRET_API_URL'] ?? 'http://10.0.2.2:8000';
  dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 3);
  dio.interceptors.add(LogInterceptor(responseBody: true));
  //* 나중에 추가할 것 - dio.interceptors.add(AuthInterceptor());
  return dio;
});

/*
 * Interceptor
 */
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {}
}

/*
 * Dio Exception
 */
class DioException implements Exception {
  final String message;
  final int? statusCode;
  final String? statusMessage;

  DioException({
    required this.message,
    this.statusCode,
    this.statusMessage,
  });

  @override
  String toString() {
    return 'DioException{message: $message, statusCode: $statusCode, statusMessage: $statusMessage}';
  }
}

/*
 * Dio Error Util
 */
class DioErrorUtil {
  static DioException getDioException(DioError error) {
    if (error.type == DioErrorType.connectionTimeout) {
      return DioException(message: 'Connection timeout');
    } else if (error.type == DioErrorType.receiveTimeout) {
      return DioException(message: 'Receive timeout');
    } else if (error.type == DioErrorType.sendTimeout) {
      return DioException(message: 'Send timeout');
    } else if (error.type == DioErrorType.badResponse) {
      return DioException(
        message: 'Response error',
        statusCode: error.response?.statusCode,
        statusMessage: error.response?.statusMessage,
      );
    } else if (error.type == DioErrorType.cancel) {
      return DioException(message: 'Request cancelled');
    } else {
      return DioException(message: 'Unknown error');
    }
  }
}
