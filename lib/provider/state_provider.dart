import 'package:he_shecret/models/user_feed_model.dart';
import 'package:he_shecret/provider/auth_state_provider.dart';
import 'app_state_provider.dart';

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///
/// app state provider
///
final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier(AppState(isBusy: false, pageIndex: 0));
});

///
/// auth state provider
///
final authStateProvier = StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier(AuthState(isBusy: false, pageIndex: 0));
});

///
/// feed view state provider
///
final feedFutureProvider = FutureProvider.autoDispose.family<List<FUserFeedModel>, int>((ref, feedId) async {
  await Future.delayed(const Duration(seconds: 2));

  final String response = await rootBundle.loadString('assets/json/userFeedTest.json');

  Iterable iter = await json.decode(response);
  // return iter.map((model) => FUserFeedModel.fromJson(model));

  return List<FUserFeedModel>.from(iter.map((model) => FUserFeedModel.fromJson(model)));
});

///
/// state provider
///
final pageNameProvider = Provider<String>((ref) {
  final appState = ref.watch(appStateProvider);

  switch (appState.getPageIndex()) {
    case 0:
      {
        return "Home";
      }
    case 1:
      return "Search";
    case 2:
      return "Notification";
    case 3:
      return "Message";
  }

  return "";
});
