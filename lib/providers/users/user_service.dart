import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/providers/entitys/user.entity.dart';

class FUserServiceState extends StateNotifier<FUserEntity> {
  FUserServiceState() : super(FUserEntity());

  FUserEntity get userEntity => state;
  set setUserEntity(FUserEntity userEntity) => state = userEntity;

  void clear() {
    state = FUserEntity();
  }
}
