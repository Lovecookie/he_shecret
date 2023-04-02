import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/providers/dio_provider.dart';

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

  checkResponse(FResponseData responseData) {
    if (!responseData.isSuccess) {
      debugPrint('❗❗❗❗❗❗❗❗❗❗❗ error: ${responseData.error} ❗❗❗❗❗❗❗❗❗❗❗');
    }
  }

  Future<Response> requestFullPath(
    String path, {
    required Options options,
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    try {
      return ref.read(dioProvider).request(
            path,
            options: options,
            queryParameters: queryParameters,
            cancelToken: cancelToken,
          );
    } on DioError catch (error) {
      throw DioErrorUtil.getDioException(error);
    }
  }

  Future<Response> request(
    String path, {
    required Options options,
    Object? data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) async {
    return await requestFullPath(
      '/$method$path',
      options: options,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    );
  }

  Future<FResponseData> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await ref.read(dioProvider).get(
            '/$method$path',
            queryParameters: queryParameters,
            data: data,
            options: options,
            cancelToken: cancelToken,
          );
      return FResponseData.fromJson(response.data);
    } on DioError catch (error) {
      throw DioErrorUtil.getDioException(error);
    }
  }

  Future<FResponseData> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await ref.read(dioProvider).post(
            '/$method$path',
            queryParameters: queryParameters,
            data: data,
            options: options,
            cancelToken: cancelToken,
          );
      return FResponseData.fromJson(response.data);
    } on DioError catch (error) {
      throw DioErrorUtil.getDioException(error);
    }
  }

  Future<FResponseData> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await ref.read(dioProvider).put(
            '/$method$path',
            queryParameters: queryParameters,
            data: data,
            options: options,
            cancelToken: cancelToken,
          );
      return FResponseData.fromJson(response.data);
    } on DioError catch (error) {
      throw DioErrorUtil.getDioException(error);
    }
  }

  Future<FResponseData> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await ref.read(dioProvider).patch(
            '/$method$path',
            queryParameters: queryParameters,
            data: data,
            options: options,
            cancelToken: cancelToken,
          );
      return FResponseData.fromJson(response.data);
    } on DioError catch (error) {
      throw DioErrorUtil.getDioException(error);
    }
  }

  Future<FResponseData> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await ref.read(dioProvider).delete(
            '/$method$path',
            queryParameters: queryParameters,
            data: data,
            options: options,
            cancelToken: cancelToken,
          );
      return FResponseData.fromJson(response.data);
    } on DioError catch (error) {
      throw DioErrorUtil.getDioException(error);
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
      throw DioErrorUtil.getDioException(error);
    }
  }
}

typedef FRequestJson = Map<String, dynamic>;
typedef FResponseJson = Map<String, dynamic>;
typedef FResponseJsonList = List<FResponseJson>;

///
/// FResponse dto type
///
abstract class FRequestDtoBase extends Equatable {
  const FRequestDtoBase();

  FRequestJson toJson();
}

abstract class FResponseDtoBase extends Equatable {
  const FResponseDtoBase();

  fromJson(FResponseJson json);
}

///
/// FResponse data type
///
class FResponseData extends Equatable {
  final int statusCode;
  final bool? success;
  final String? timestamp;
  final List<String>? message;
  final String? error;
  final FResponseJsonList? data;

  const FResponseData({
    required this.statusCode,
    required this.success,
    required this.message,
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

  bool get isSuccess => statusCode == 200;

  factory FResponseData.fromJson(Map<String, dynamic> json) {
    List<Map<String, dynamic>>? data;
    if (json['data'] != null) {
      if (json['data'] is List) {
        data = json['data'] as FResponseJsonList;
      } else if (json['data'] is Map) {
        data = [json['data'] as FResponseJson];
      }
    }

    List<String>? message;
    if (json['message'] != null) {
      if (json['message'] is List) {
        message = (json['message'] as List<dynamic>?)?.map((e) => e?.toString() ?? '').toList();
      } else {
        message = [json['message'].cast<String>()];
      }
    }

    return FResponseData(
      statusCode: json['statusCode'] as int,
      success: json['success'] as bool,
      message: message,
      timestamp: json['timestamp'] as String?,
      error: json['errorMessage'] as String?,
      data: data,
    );
  }

  String getErrorString() {
    return 'FResponseData{statusCode: $statusCode, success: $success, timestamp: $timestamp, message: $message, error: $error, data: $data}';
  }
}
