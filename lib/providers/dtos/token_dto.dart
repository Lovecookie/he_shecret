
import 'package:shipcret/providers/repository_base.dart';

class FTokenDto extends FResponseDtoBase {
  final String accessToken;
  final String refreshToken;

  const FTokenDto({
    this.accessToken = '',
    this.refreshToken = '',
  });

  @override
  List<Object?> get props => [accessToken, refreshToken];

  @override
  fromJson(FResponseJson json) {
    return FTokenDto.fromJson(json);
  }

  factory FTokenDto.fromJson(FResponseJson json) {
    return FTokenDto(
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
