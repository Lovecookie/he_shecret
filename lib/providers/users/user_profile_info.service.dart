import 'package:shipcret/providers/entitys/user_profile.entity.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProfileServiceProvider = StateNotifierProvider<FUserProfileInfoServiceState, FUserProfileEntity>((ref) {
  return FUserProfileInfoServiceState();
});

class FUserProfileInfoServiceState extends StateNotifier<FUserProfileEntity> {
  FUserProfileInfoServiceState() : super(FUserProfileEntity());

  FUserProfileEntity get userProfileEntity => state;
  set setUserEntity(FUserProfileEntity userEntity) => state = userEntity;

  void clear() {
    state = FUserProfileEntity();
  }
}
