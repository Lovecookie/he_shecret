import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/providers/dio_provider.dart';

final userRepositoryProvider = Provider<FUserRepository>((ref) {
  return FUserRepository(ref);
});

class FUserRepository {
  final Ref ref;
  final int Function() _getCurrentTimestamp;

  FUserRepository(
    this.ref, {
    int Function()? getCurrentTimestamp,
  }) : _getCurrentTimestamp = getCurrentTimestamp ?? (() => DateTime.now().millisecondsSinceEpoch);

  Future<FResponseData> fetchUser() async {
    final responseData = await _get('/get-info', data: {'useruuid': '1'});
    if (!responseData.isSuccess) {
      debugPrint('❗❗❗❗❗❗❗❗❗❗❗ error: ${responseData.error} ❗❗❗❗❗❗❗❗❗❗❗');
    }

    return responseData;
  }

  Future<FResponseData> _get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Object? data,
  }) async {
    try {
      final response = await ref.read(dioProvider).get(
            path,
            queryParameters: queryParameters,
            data: data,
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
  final String message;
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
    return FResponseData(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      success: json['success'] as bool?,
      timestamp: json['timestamp'] as String?,
      error: json['errorMessage'] as String?,
      data: json['data']?.cast<Map<String, dynamic>>() ?? [],
    );
  }

  bool get isSuccess => statusCode == 200;
}
