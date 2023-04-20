import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  late AnimationController _animationController;
  late Animation<double> _buttonAnimatedIcon;
  late Animation<double> _translateButton;
  bool _isExpanded = false;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    // )..addListener(
    //     () {
    //       setState(() {});
    //     },
    //   );

    _buttonAnimatedIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _translateButton = Tween<double>(begin: 100, end: -20).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
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
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: FCommonColor.yellowGodic,
      //     onPressed: () {},
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(30),
      //     ),
      //     child: const Icon(
      //       Icons.add,
      //       color: FCommonColor.greyYellow,
      //     )),
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
            return Transform(
              transform: Matrix4.translationValues(0.0, _translateButton.value * 4.0, 0.0),
              child: child,
            );
          },
          child: FloatingActionButton(
            heroTag: 'emailTag',
            backgroundColor: FCommonColor.yellowGodic,
            onPressed: () {},
            child: const Icon(Icons.email),
          ),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, _translateButton.value * 3.0, 0.0),
              child: child,
            );
          },
          child: FloatingActionButton(
            heroTag: 'callTag',
            backgroundColor: FCommonColor.yellowGodic,
            onPressed: () {},
            child: const Icon(Icons.call),
          ),
        ),
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, _translateButton.value * 2.0, 0.0),
              child: child,
            );
          },
          child: FloatingActionButton(
            heroTag: 'messageTag',
            backgroundColor: FCommonColor.yellowGodic,
            onPressed: () {},
            child: const Icon(Icons.message),
          ),
        ),
        FloatingActionButton(
          heroTag: 'menuTag',
          onPressed: _toggle,
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
