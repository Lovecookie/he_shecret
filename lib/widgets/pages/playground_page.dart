import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:shipcret/common/common_ui_overlay_style.dart';
import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/providers/state_provider.dart';
import 'package:shipcret/widgets/bottom_menu/bottom_menu_bar.dart';
import 'package:shipcret/widgets/common/widget_enum.dart';
import 'package:shipcret/widgets/home/home_sub_page.dart';
import 'package:shipcret/widgets/home/welcome_user_page.dart';
import 'package:shipcret/widgets/notification/notification_sub_page.dart';
import 'package:shipcret/widgets/search/search_sub_page.dart';
import 'package:shipcret/widgets/message/message_sub_page.dart';

import 'package:flutter/material.dart';

class FPlaygroundPage extends ConsumerStatefulWidget {
  const FPlaygroundPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FPlaygroundPageState();
}

class _FPlaygroundPageState extends ConsumerState<FPlaygroundPage> with SingleTickerProviderStateMixin {
  final int animatedMilliseconds = 300;
  final int fadeMilliseconds = 600;

  late AnimationController _animationController;
  late Animation<double> _buttonAnimatedIcon;
  late Animation<Offset> _translateButton;
  bool _isExpanded = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: animatedMilliseconds),
    );

    _buttonAnimatedIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _translateButton = Tween<Offset>(begin: const Offset(0.0, 55.0), end: const Offset(0, -20.0)).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastOutSlowIn,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FCommonUIOverlayStyle.topStateBar(color: FCommonColor.mattBlack);

    var appState = ref.watch(appStateProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _getPage(appState.getSubPage()),
      floatingActionButton: _animatedButton(),
      bottomNavigationBar: FBottomMenuBar(),
    );
  }

  Widget _getPage(ESubPage subPage) {
    switch (subPage) {
      case ESubPage.welcomeUser:
        return const FWelcomeUserPage();
      case ESubPage.home:
        return const FHomeSubPage();
      case ESubPage.search:
        return const FSearchSubPage();
      case ESubPage.notification:
        return const FNotificationSubPage();
      case ESubPage.message:
        return const FMessageSubPage();
    }
  }

  Widget _animatedButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.translate(
                offset: _translateButton.value * 3.0,
                child: AnimatedOpacity(
                  opacity: _isExpanded ? 1.0 : 0.0,
                  duration: Duration(milliseconds: fadeMilliseconds),
                  child: child,
                ));
          },
          child: FloatingActionButton(
            heroTag: 'userTag',
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            backgroundColor: FCommonColor.yellowGodic,
            child: const Icon(FontAwesome5.user_alt),
          ),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: _translateButton.value * 2.0,
              child: AnimatedOpacity(
                opacity: _isExpanded ? 1.0 : 0.0,
                duration: Duration(milliseconds: fadeMilliseconds),
                child: child,
              ),
            );
          },
          child: FloatingActionButton(
            heroTag: 'sendToUserTag',
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            backgroundColor: FCommonColor.yellowGodic,
            child: const Icon(FontAwesome5.paper_plane),
          ),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.translate(
              offset: _translateButton.value * 1.0,
              child: AnimatedOpacity(
                opacity: _isExpanded ? 1.0 : 0.0,
                duration: Duration(milliseconds: fadeMilliseconds),
                child: child,
              ),
            );
          },
          child: FloatingActionButton(
            heroTag: 'historyTag',
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            backgroundColor: FCommonColor.yellowGodic,
            child: const Icon(FontAwesome5.history),
          ),
        ),
        FloatingActionButton(
          heroTag: 'menuTag',
          onPressed: _toggle,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          backgroundColor: FCommonColor.yellowGodic,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _buttonAnimatedIcon,
          ),
        ),
      ],
    );
  }

  _toggle() {
    if (_isExpanded) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }

    _isExpanded = !_isExpanded;
  }
}
