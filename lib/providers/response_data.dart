import 'package:equatable/equatable.dart';

typedef FRequestJson = Map<String, dynamic>;
typedef FResponseJson = Map<String, dynamic>;
typedef FResponseJsonList = List<FResponseJson>;

///
/// FResponse dto type
///
abstract class FDtoBase extends Equatable {
  const FDtoBase();

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

  bool get isSuccess => statusCode == 200 || statusCode == 201;

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
        message = [json['message'] as String];
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

  factory FResponseData.fromError(
    String message, {
    Map<String, dynamic>? json,
  }) {
    return FResponseData(
      statusCode: json?['statusCode'] as int? ?? 500,
      success: false,
      message: [message],
      timestamp: json?['timestamp'] as String?,
      error: json?['errorMessage'] as String?,
      data: null,
    );
  }

  String getErrorString() {
    return 'FResponseData{statusCode: $statusCode, success: $success, timestamp: $timestamp, message: $message, error: $error, data: $data}';
  }
}
