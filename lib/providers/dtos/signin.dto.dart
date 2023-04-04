import 'package:shipcret/providers/response_data.dart';

class FSignInDto extends FDtoBase {
  final String email;
  final String password;

  const FSignInDto({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];

  @override
  FRequestJson toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
