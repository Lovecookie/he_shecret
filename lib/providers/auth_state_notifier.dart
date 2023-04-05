import 'package:shipcret/common/common_enum.dart';
import 'package:shipcret/providers/entitys/user.entity.dart';
import 'package:shipcret/providers/app_state_notifier.dart';
import 'package:shipcret/widgets/common/widget_enum.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(super.state);

  String signIn({required String email, required String password, required BuildContext context}) {
    return "";
  }
}

// ignore: must_be_immutable
class AuthState extends FSubPageState {
  EAuthStatusType authStatusType = EAuthStatusType.notDetermined;
  FUserEntity? _userModel;

  AuthState({
    bool isBusy = false,
    ESubPage subPage = ESubPage.welcomeUser,
    EAuthStatusType authStatusType = EAuthStatusType.notDetermined,
    FUserEntity? userModel,
  }) : super(isBusy: isBusy, subPage: subPage) {
    _userModel = userModel;
  }

  FUserEntity? get userModel => _userModel;
  FUserEntity? get profileUserModel => _userModel;

  String signIn(String email, String password, {required BuildContext context}) {
    setBusy(true);

    return "";
  }
}
