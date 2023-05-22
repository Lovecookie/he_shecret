import 'package:fixnum/fixnum.dart';
import 'package:shipcret/providers/entitys/user.entity.dart';
import 'package:shipcret/providers/entitys/user_profile.entity.dart';
import 'package:shipcret/providers/users/user_repository.dart';
import 'package:shipcret/providers/users/user_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final myUserServiceProvider = StateNotifierProvider<FUserServiceState, FUserEntity>((ref) {
  return FUserServiceState();
});

final myUserFutureProvider = FutureProvider.autoDispose<FUserEntity>((ref) async {
  final optional = await ref.read(userRepository).myInfo();
  if (!optional.hasValue) {
    return FUserEntity();
  }

  ref.read(myUserServiceProvider.notifier).setUserEntity(FUserEntity.fromJson(optional.value.toJson()));

  return FUserEntity.fromJson(optional.value.toJson());
});

final userProfileProvider = FutureProvider.autoDispose.family<FUserProfileEntity, Int64>((ref, useruuid) async {
  final optional = await ref.read(userRepository).myProfile();
  if (!optional.hasValue) {
    return FUserProfileEntity();
  }

  return FUserProfileEntity.fromJson(optional.value.toJson());
});
