import 'package:equatable/equatable.dart';
import 'package:shipcret/common/utils/util.dart';

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
}

///
/// FResponse data type
///
class FResponseData extends Equatable {
  final int resultCode;
  final bool? success;
  final String? timestamp;
  final List<String>? message;
  final String? error;
  final FResponseJsonList? data;

  const FResponseData({
    required this.resultCode,
    required this.success,
    required this.message,
    this.timestamp,
    this.error,
    this.data,
  });

  @override
  List<Object?> get props => [
        resultCode,
        success,
        timestamp,
        message,
        error,
        data,
      ];

  bool get isSuccess => (resultCode == 200 || resultCode == 201 || resultCode == FResultCode.success);

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
      resultCode: json['statusCode'] as int,
      success: json['success'] as bool,
      message: message,
      timestamp: json['timestamp'] as String?,
      error: json['errorMessage'] as String?,
      data: data,
    );
  }

  factory FResponseData.fromError(
    String message, {
    int? resultCode,
    Map<String, dynamic>? json,
  }) {
    return FResponseData(
      resultCode: resultCode ?? json?['statusCode'] as int? ?? FResultCode.unknownError,
      success: false,
      message: [message],
      timestamp: json?['timestamp'] as String?,
      error: json?['errorMessage'] as String?,
      data: null,
    );
  }

  String getErrorString() {
    return 'FResponseData{resultCode: $resultCode, success: $success, timestamp: $timestamp, message: $message, error: $error, data: $data}';
  }
}
