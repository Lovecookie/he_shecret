import 'package:shipcret/providers/repository_base.dart';

class FSignInDto extends FRequestDtoBase {
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
