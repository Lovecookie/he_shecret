import 'package:shipcret/providers/response_data.dart';

class FTokenResponseDto extends FResponseDto {
  final String accessToken;
  final String refreshToken;

  const FTokenResponseDto({
    this.accessToken = '',
    this.refreshToken = '',
  });

  @override
  List<Object?> get props => [accessToken, refreshToken];

  @override
  FResponseJson toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  static FTokenResponseDto fromJson(FResponseJson json) {
    return FTokenResponseDto(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
