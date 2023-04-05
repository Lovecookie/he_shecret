import 'package:shipcret/providers/response_data.dart';

class FSignUserResponseDto extends FResponseDto {
  final String name;
  final String email;

  const FSignUserResponseDto({
    this.name = '',
    this.email = '',
  });

  @override
  List<Object?> get props => [
        name,
        email,
      ];

  @override
  FResponseJson toJson() {
    return {
      'name': name,
      'email': email,
    };
  }

  factory FSignUserResponseDto.fromJson(FResponseJson json) {
    return FSignUserResponseDto(
      name: json['name'],
      email: json['email'],
    );
  }
}
