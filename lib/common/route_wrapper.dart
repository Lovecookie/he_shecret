import 'package:shipcret/widgets/pages/playground_page.dart';
import 'package:shipcret/widgets/pages/sign_in_page.dart';
import 'package:shipcret/widgets/pages/sign_up_page.dart';
import 'package:shipcret/widgets/pages/welcome_page.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

///
/// FRouteName
///
class FRouteName {
  static const String permission = 'permission';
  static const String welcome = 'welcome';
  static const String signUp = 'signUp';
  static const String signIn = 'signIn';

  static const String playground = 'playground';
}

///
/// FAppRoute
///
class FAppRoute {
  static void go(BuildContext context, String routeName) {
    context.goNamed(routeName);
  }

  static void push(BuildContext context, String routeName) {
    context.pushNamed(routeName);
  }

  static void pop(BuildContext context) {
    context.pop();
  }
}

///
/// FRouteWrapper
///
class FRouteWrapper {
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: kDebugMode ? true : false,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        name: FRouteName.welcome,
        path: '/',
        pageBuilder: (context, state) => _slidePageBuilder(context, state, const FWelcomePage()),
        routes: [
          GoRoute(
              name: FRouteName.signUp,
              path: '$FRouteName.signUp',
              pageBuilder: (context, state) => _slidePageBuilder(context, state, const FSignUpPage())),
          GoRoute(
              name: FRouteName.signIn,
              path: '$FRouteName.signIn',
              pageBuilder: (context, state) => _slidePageBuilder(context, state, const FSignInPage())),
        ],
      ),
      GoRoute(
          name: FRouteName.playground,
          path: '/$FAppRoute.playground',
          pageBuilder: (context, state) => _slidePageBuilder(context, state, const FPlaygroundPage())),
    ],
  );

  static GoRouter get router => _router;

  static _slidePageBuilder(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) =>
      CustomTransitionPage<void>(
          key: state.pageKey,
          child: child,
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (context, animation, secondaryAnimation, child) => SlideTransition(
              position: animation.drive(Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).chain(CurveTween(curve: Curves.ease))),
              child: child));
}
