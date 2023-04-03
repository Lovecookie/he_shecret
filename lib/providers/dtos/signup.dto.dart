import 'package:shipcret/providers/response_data.dart';

class FSignUpDto extends FRequestDtoBase {
  final String name;
  final String email;
  final String password;
  // final String firstName;
  // final String lastName;
  // final String phoneNumber;
  // final String? referralCode;

  const FSignUpDto({
    required this.name,
    required this.email,
    required this.password,
    // required this.firstName,
    // required this.lastName,
    // required this.phoneNumber,
    // this.referralCode,
  });

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        // firstName,
        // lastName,
        // phoneNumber,
        // referralCode,
      ];

  @override
  FRequestJson toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      // 'firstName': firstName,
      // 'lastName': lastName,
      // 'phoneNumber': phoneNumber,
      // 'referralCode': referralCode,
    };
  }
}
