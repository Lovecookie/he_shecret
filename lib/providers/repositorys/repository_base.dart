import 'package:equatable/equatable.dart';
import '../dio_provider.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class FRepositoryBase {
  final Ref ref;
  final String method;
  final Provider<Dio> dioProvider;
  final int Function() _getCurrentTimestamp;

  FRepositoryBase(
    this.ref,
    this.dioProvider,
    String method, {
    int Function()? getCurrentTimestamp,
  })  : method = (method.endsWith('/') ? method : '$method/'),
        _getCurrentTimestamp = getCurrentTimestamp ?? (() => DateTime.now().millisecondsSinceEpoch);

  FResponseData _handleError(DioError dioError) {
    if (dioError.type == DioErrorType.badResponse) {
      return FResponseData.fromJson(dioError.response?.data);
    } else {
      throw DioErrorUtil.getDioException(dioError);
    }
  }

  Future<FResponseData> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await ref.read(dioProvider).get(
            '/$method$path',
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken,
          );
      return FResponseData.fromJson(response.data);
    } on DioError catch (error) {
      return _handleError(error);
    }
  }

  Future<FResponseData> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await ref.read(dioProvider).post(
            '/$method$path',
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken,
          );
      return FResponseData.fromJson(response.data);
    } on DioError catch (error) {
      if (error.type == DioErrorType.badResponse) {
        return FResponseData.fromJson(error.response?.data);
      } else {
        throw DioErrorUtil.getDioException(error);
      }
    }
  }

  Future<FResponseData> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await ref.read(dioProvider).put(
            '/$method$path',
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken,
          );
      return FResponseData.fromJson(response.data);
    } on DioError catch (error) {
      if (error.type == DioErrorType.badResponse) {
        return FResponseData.fromJson(error.response?.data);
      } else {
        throw DioErrorUtil.getDioException(error);
      }
    }
  }

  Future<FResponseData> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await ref.read(dioProvider).patch(
            '/$method$path',
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken,
          );
      return FResponseData.fromJson(response.data);
    } on DioError catch (error) {
      if (error.type == DioErrorType.badResponse) {
        return FResponseData.fromJson(error.response?.data);
      } else {
        throw DioErrorUtil.getDioException(error);
      }
    }
  }

  Future<FResponseData> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await ref.read(dioProvider).delete(
            '/$method$path',
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken,
          );
      return FResponseData.fromJson(response.data);
    } on DioError catch (error) {
      if (error.type == DioErrorType.badResponse) {
        return FResponseData.fromJson(error.response?.data);
      } else {
        throw DioErrorUtil.getDioException(error);
      }
    }
  }

  ///
  /// Download file - 이 부분은 검증이 필요하다. 검증 후 사용하도록 하자
  ///
  Future<FResponseData> download(
    String urlPath,
    String savePath, {
    ProgressCallback? onReceiveProgress,
    Map<String, dynamic>? queryParameters,
    Object? data,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await ref.read(dioProvider).download(
            urlPath,
            savePath,
            onReceiveProgress: onReceiveProgress,
            queryParameters: queryParameters,
            data: data,
            cancelToken: cancelToken,
          );
      return FResponseData.fromJson(response.data);
    } on DioError catch (error) {
      if (error.type == DioErrorType.badResponse) {
        return FResponseData.fromJson(error.response?.data);
      } else {
        throw DioErrorUtil.getDioException(error);
      }
    }
  }
}

class FResponseData extends Equatable {
  final int statusCode;
  final bool? success;
  final String? timestamp;
  final String? message;
  final String? error;
  final List<Map<String, dynamic>>? data;

  const FResponseData({
    required this.statusCode,
    required this.message,
    this.success,
    this.timestamp,
    this.error,
    this.data,
  });

  @override
  List<Object?> get props => [
        statusCode,
        success,
        timestamp,
        message,
        error,
        data,
      ];

  factory FResponseData.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>>? data;
    if (json['data'] != null) {
      if (json['data'] is List) {
        data = json['data'] as List<Map<String, dynamic>>;
      } else if (json['data'] is Map) {
        data = [json['data'] as Map<String, dynamic>];
      }
    }

    return FResponseData(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String?,
      success: json['success'] as bool?,
      timestamp: json['timestamp'] as String?,
      error: json['errorMessage'] as String?,
      data: data,
    );
  }

  bool get isSuccess => statusCode == 200;
}
