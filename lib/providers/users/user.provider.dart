import 'package:equatable/equatable.dart';
import 'package:fixnum/fixnum.dart';
import 'package:shipcret/common/utils/util.dart';
import 'package:shipcret/providers/entitys/user.entity.dart';
import 'package:shipcret/providers/entitys/user_profile.entity.dart';
import 'package:shipcret/providers/users/user_repository.dart';
import 'package:shipcret/providers/users/user_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class FMyUserInfo extends Equatable {
  FUserEntity userEntity;
  FUserProfileEntity userProfileEntity;

  FMyUserInfo({
    required this.userEntity,
    required this.userProfileEntity,
  });

  @override
  List<Object?> get props => [userEntity, userProfileEntity];

  get userEntityGetter => userEntity;
  get userProfileEntityGetter => userProfileEntity;
  get isEmpty => userEntity.useruuid == 0 && userProfileEntity.useruuid == 0;

  void setUserEntity(FUserEntity userEntity) {
    this.userEntity = userEntity;
  }

  void setUserProfileEntity(FUserProfileEntity userProfileEntity) {
    this.userProfileEntity = userProfileEntity;
  }

  void setUserInfo(FUserEntity userEntity, FUserProfileEntity userProfileEntity) {
    this.userEntity = userEntity;
    this.userProfileEntity = userProfileEntity;
  }
}

final myUserInfoProvider = Provider<FMyUserInfo>((ref) {
  return FMyUserInfo(
    userEntity: FUserEntity(),
    userProfileEntity: FUserProfileEntity(),
  );
});

final myUserServiceProvider = StateNotifierProvider<FUserServiceState, FUserEntity>((ref) {
  return FUserServiceState();
});

final myUserFutureProvider = FutureProvider.autoDispose.family<FOptional<FMyUserInfo>, bool>((ref, isRefresh) async {
  if (!isRefresh) {
    if (!ref.read(myUserInfoProvider).isEmpty) {
      return FOptional(ref.read(myUserInfoProvider));
    }
  }

  final optional = await ref.read(userRepository).myInfo();
  if (!optional.hasValue) {
    return FNullOpt();
  }

  final profileOptional = await ref.read(userRepository).myProfile();
  if (profileOptional.hasValue) {
    return FNullOpt();
  }

  ref.read(myUserInfoProvider).setUserInfo(
        FUserEntity.fromJson(optional.value.toJson()),
        FUserProfileEntity.fromJson(profileOptional.value.toJson()),
      );

  return FOptional(ref.read(myUserInfoProvider));
});

final userProfileProvider = FutureProvider.autoDispose.family<FUserProfileEntity, Int64>((ref, useruuid) async {
  final optional = await ref.read(userRepository).myProfile();
  if (!optional.hasValue) {
    return FUserProfileEntity();
  }

  return FUserProfileEntity.fromJson(optional.value.toJson());
});
