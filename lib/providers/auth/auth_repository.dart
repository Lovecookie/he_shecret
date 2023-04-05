import 'package:shipcret/common/utils/util.dart' as util;
import 'package:shipcret/providers/auth/sign_user.responseDto.dart';
import 'package:shipcret/providers/auth/signin.requestDto.dart';
import 'package:shipcret/providers/auth/signup.requestDto.dart';
import 'package:shipcret/providers/auth/token.responseDto.dart';
import 'package:shipcret/providers/dio_provider.dart';
import 'package:shipcret/providers/repository_base.dart';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepository = Provider<FAuthRepository>((ref) {
  return FAuthRepository(ref);
});

class FAuthRepository extends FRepositoryBase {
  FAuthRepository(Ref ref) : super(ref, authDioProvider, 'auth');

  util.FFutureResOptional login(String email, String password) async {
    final responseData = await post('/login', data: {'email': email, 'password': password});
    if (!responseData.isSuccess) {
      return util.FNullResOpt(responseData.resultCode);
    }

    return util.FResOptional(FTokenResponseDto.fromJson(responseData.data!.first));
  }

  util.FFutureResOptional signUp(FSignUpRequestDto signupDto) async {
    final responseData = await post('/signup', data: signupDto.toJson());
    if (!responseData.isSuccess) {
      return util.FNullResOpt(responseData.resultCode);
    }

    return util.FResOptional(FSignUserResponseDto.fromJson(responseData.data!.first));
  }

  util.FFutureResOptional signIn(FSignInRequestDto signinDto) async {
    final responseData = await post('/signin', data: signinDto.toJson());
    if (!responseData.isSuccess) {
      return util.FNullResOpt(responseData.resultCode);
    }

    return util.FResOptional(FSignUserResponseDto.fromJson(responseData.data!.first));
  }

  util.FFutureResOptional logout({required String email, required String password}) async {
    final responseData = await post('/signin', data: {'email': email, 'password': password});
    if (!responseData.isSuccess) {
      return util.FNullResOpt(responseData.resultCode);
    }

    return util.FResOptional(FTokenResponseDto.fromJson(responseData.data!.first));
  }

  util.FFutureResOptional refreshToken({required Options options}) async {
    final responseData = await post('/refresh-token', options: options);
    if (!responseData.isSuccess) {
      return util.FNullResOpt(responseData.resultCode);
    }

    return util.FResOptional(FTokenResponseDto.fromJson(responseData.data!.first));
  }
}
