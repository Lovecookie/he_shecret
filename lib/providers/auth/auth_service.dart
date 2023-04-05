import 'package:shipcret/common/common_enum.dart';
import 'package:shipcret/common/utils/util.dart' as utils;
import 'package:shipcret/providers/auth/auth_repository.dart';
import 'package:shipcret/providers/auth/signin.dto.dart';
import 'package:shipcret/providers/auth/signup.dto.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<FAuthService>((ref) {
  return FAuthService(ref);
});

final authWelcomeProvider = FutureProvider.autoDispose<utils.FResOptional>((ref) async {
  final welcomeType = ref.read(authServiceProvider).welcomeType;

  switch (welcomeType) {
    case EWelcomeType.signin:
      final signInDto = ref.read(authServiceProvider).getSignInDto();
      return await ref.read(authRepository).signIn(signInDto);
    case EWelcomeType.signup:
      final signUpDto = ref.read(authServiceProvider).getSignUpDto();
      return await ref.read(authRepository).signUp(signUpDto);
    default:
      return utils.FNullResOpt.unknownError();
  }
});

class FAuthService {
  final Ref ref;
  bool _isSignIn = false;
  EWelcomeType _welcomeType = EWelcomeType.none;

  late String _name;
  late String _email;
  late String _password;

  FAuthService(this.ref);

  bool get isSignIn => _isSignIn;
  EWelcomeType get welcomeType => _welcomeType;

  onLoginSuccess({required String name, required String email}) {
    _isSignIn = true;
    _name = name;
    _email = email;
    _password = '';
  }

  onLogoutSucess() {
    _isSignIn = false;
    _name = '';
    _email = '';
    _password = '';
  }

  setSignUpInfo({required String name, required String email, required String password}) {
    _welcomeType = EWelcomeType.signup;
    _name = name;
    _email = email;
    _password = password;
  }

  setSignInInfo({required String email, required String password}) {
    _welcomeType = EWelcomeType.signin;
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
