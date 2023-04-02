import 'package:shipcret/common/common_enum.dart';
import 'package:shipcret/models/user_model.dart';
import 'package:shipcret/providers/app_state_notifier.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:shipcret/widgets/common/widget_enum.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(super.state);

  String signIn({required String email, required String password, required BuildContext context}) {
    return "";
  }
}

// ignore: must_be_immutable
class AuthState extends FSubPageState {
  EAuthStatusType authStatusType = EAuthStatusType.notDetermined;
  FUserModel? _userModel;

  AuthState({
    bool isBusy = false,
    ESubPage subPage = ESubPage.welcomeUser,
    EAuthStatusType authStatusType = EAuthStatusType.notDetermined,
    FUserModel? userModel,
  }) : super(isBusy: isBusy, subPage: subPage) {
    _userModel = userModel;
  }

  FUserModel? get userModel => _userModel;
  FUserModel? get profileUserModel => _userModel;

  String signIn(String email, String password, {required BuildContext context}) {
    setBusy(true);

    return "";
  }
}
