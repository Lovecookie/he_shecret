
import 'package:shipcret/providers/response_data.dart';

class FSignUserInfoDto extends FResponseDtoBase {
  final String name;
  final String email;

  const FSignUserInfoDto({
    this.name = '',
    this.email = '',
  });

  @override
  List<Object?> get props => [
        name,
        email,
      ];

  @override
  FSignUserInfoDto fromJson(FResponseJson json) {
    return FSignUserInfoDto.fromJson(json);
  }

  factory FSignUserInfoDto.fromJson(FResponseJson json) {
    return FSignUserInfoDto(
      name: json['name'],
      email: json['email'],
    );
  }
}
