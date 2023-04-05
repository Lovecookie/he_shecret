
import 'package:shipcret/providers/response_data.dart';

class FSignInRequestDto extends FRequestDtoBase {
  final String email;
  final String password;

  const FSignInRequestDto({required this.email, required this.password});

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
