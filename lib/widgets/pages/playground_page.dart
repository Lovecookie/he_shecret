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

class _FPlaygroundPageState extends ConsumerState<FPlaygroundPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FCommonUIOverlayStyle.topStateBar(color: FCommonColor.mattBlack);

    var appState = ref.watch(appStateProvider);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _getPage(appState.getSubPage()),
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
}
