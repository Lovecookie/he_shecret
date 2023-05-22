import 'package:shipcret/providers/entitys/user.entity.dart';
import 'package:shipcret/providers/entitys/user_profile.entity.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class FUserServiceState extends StateNotifier<FUserEntity> {
  FUserServiceState() : super(FUserEntity());

  FUserEntity get userEntity => state;

  void setUserEntity(FUserEntity userEntity) {
    state = userEntity;
  }

  void clear() {
    state = FUserEntity();
  }
}

class FUserProfileInfoServiceState extends StateNotifier<FUserProfileEntity> {
  FUserProfileInfoServiceState() : super(FUserProfileEntity());

  FUserProfileEntity get userProfileEntity => state;
  set setUserEntity(FUserProfileEntity userEntity) => state = userEntity;

  void clear() {
    state = FUserProfileEntity();
  }
}
