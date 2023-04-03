import 'package:dio/dio.dart';
import 'package:shipcret/providers/dtos/token_dto.dart';
import 'package:shipcret/providers/dio_provider.dart';
import 'package:shipcret/providers/dtos/sign-user-info.dto.dart';
import 'package:shipcret/providers/dtos/signin.dto.dart';
import 'package:shipcret/providers/dtos/signup.dto.dart';
import 'package:shipcret/providers/repository_base.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class FAuthRepository extends FRepositoryBase {
  // late FAuthTokenEntity _authTokenEntity;

  FAuthRepository(Ref ref) : super(ref, authDioProvider, 'auth');

  static final provider = Provider<FAuthRepository>((ref) {
    return FAuthRepository(ref);
  });

  Future<FTokenDto> login(String email, String password) async {
    final responseData = await post('/login', data: {'email': email, 'password': password});
    if (!responseData.isSuccess) {
      return const FTokenDto();
    } else {
      return FTokenDto.fromJson(responseData.data!.first);
    }
  }

  Future<FSignUserInfoDto> signUp(FSignUpDto signupDto) async {
    final responseData = await post('/signup', data: signupDto.toJson());
    if (!responseData.isSuccess) {
      return const FSignUserInfoDto();
    } else {
      return FSignUserInfoDto.fromJson(responseData.data!.first);
    }
  }

  Future<FSignUserInfoDto> signIn(FSignInDto signinDto) async {
    final responseData = await post('/signin', data: signinDto.toJson());
    if (!responseData.isSuccess) {
      return const FSignUserInfoDto();
    } else {
      return FSignUserInfoDto.fromJson(responseData.data!.first);
    }
  }

  Future<FTokenDto> logout({required String email, required String password}) async {
    final responseData = await post('/signin', data: {'email': email, 'password': password});
    if (!responseData.isSuccess) {
      return const FTokenDto();
    } else {
      return FTokenDto.fromJson(responseData.data!.first);
    }
  }

  Future<FTokenDto> refreshToken({required Options options}) async {
    final responseData = await post('/refresh-token', options: options);
    if (!responseData.isSuccess) {
      return const FTokenDto();
    } else {
      return FTokenDto.fromJson(responseData.data!.first);
    }
  }
}
