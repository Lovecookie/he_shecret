import 'package:shipcret/providers/dio_provider.dart';
import 'package:shipcret/providers/response_data.dart';

import 'package:flutter/material.dart';
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
      return DioErrorUtil.convertError(error);
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
      return DioErrorUtil.convertError(error);
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
      return DioErrorUtil.convertError(error);
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
      return DioErrorUtil.convertError(error);
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
      return DioErrorUtil.convertError(error);
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
