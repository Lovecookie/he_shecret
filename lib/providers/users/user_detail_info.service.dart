import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/providers/entitys/user.entity.dart';

final userProfileServiceProvider = StateNotifierProvider<FUserDetailInfoServiceState, FUserEntity>((ref) {
  return FUserDetailInfoServiceState();
});

class FUserDetailInfoServiceState extends StateNotifier<FUserEntity> {
  FUserDetailInfoServiceState() : super(FUserEntity());

  FUserEntity get userEntity => state;
  set setUserEntity(FUserEntity userEntity) => state = userEntity;

  void clear() {
    state = FUserEntity();
  }
}
