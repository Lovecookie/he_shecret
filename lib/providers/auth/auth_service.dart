import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/providers/auth/auth_repository.dart';
import 'package:shipcret/providers/dtos/sign-user-info.dto.dart';
import 'package:shipcret/providers/dtos/signin.dto.dart';
import 'package:shipcret/providers/dtos/signup.dto.dart';

final authServiceProvider = Provider<FAuthService>((ref) {
  return FAuthService(ref);
});

final authSignInProvider = FutureProvider.autoDispose<FSignUserInfoDto>((ref) async {
  final signInDto = ref.read(authServiceProvider).getSignInDto();

  return await ref.read(FAuthRepository.provider).signIn(signInDto);
});

final authSignUpProvider = FutureProvider.autoDispose<FSignUserInfoDto>((ref) async {
  final signUpDto = ref.read(authServiceProvider).getSignUpDto();

  return await ref.read(FAuthRepository.provider).signUp(signUpDto);
});

class FAuthService {
  final Ref ref;
  late String _name;
  late String _email;
  late String _password;

  FAuthService(this.ref);

  loginSuccess({required String name, required String email}) {
    _name = name;
    _email = email;
    _password = '';
  }

  setSignUpInfo({required String name, required String email, required String password}) {
    _name = name;
    _email = email;
    _password = password;
  }

  setSignInInfo({required String email, required String password}) {
    _email = email;
    _password = password;
  }

  FSignInDto getSignInDto() {
    return FSignInDto(email: _email, password: _password);
  }

  FSignUpDto getSignUpDto() {
    return FSignUpDto(name: _name, email: _email, password: _password);
  }
}
