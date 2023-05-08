import 'package:shipcret/providers/entitys/user.entity.dart';
import 'package:shipcret/providers/entitys/user_profile.entity.dart';
import 'package:shipcret/providers/users/user_repository.dart';
import 'package:shipcret/providers/users/user_service.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userServiceProvider = StateNotifierProvider<FUserServiceState, FUserEntity>((ref) {
  return FUserServiceState();
});

final userProfileProvider = FutureProvider.autoDispose<FUserProfileEntity>((ref) async {
  final optional = await ref.read(userRepository).myProfile();
  if (!optional.hasValue) {
    return FUserProfileEntity();
  }

  return FUserProfileEntity.fromJson(optional.value.toJson());
});
