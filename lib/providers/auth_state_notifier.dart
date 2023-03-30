import 'package:shipcret/common/common_enum.dart';
import 'package:shipcret/models/user_model.dart';
import 'package:shipcret/providers/app_state_notifier.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:ffi';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier(super.state);

  String signIn({required String email, required String password, required BuildContext context}) {
    return "";
  }
}

// ignore: must_be_immutable
class AuthState extends AppState {
  EAuthStatusType authStatusType = EAuthStatusType.notDetermined;
  late Int64 userId;
  FUserModel? _userModel;

  AuthState({required super.isBusy, required super.pageIndex});

  FUserModel? get userModel => _userModel;
  FUserModel? get profileUserModel => _userModel;

  String signIn(String email, String password, {required BuildContext context}) {
    setBusy(true);

    return "";
  }
  // Future<String?> signIn(String email, String password, {required BuildContext context}) async {
  //   try {
  //     setBusy(true);
  //   } catch {
  //   }
  //   return null;
  // }
}
