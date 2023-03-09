import 'package:shipcret/provider/state_provider.dart';
import 'package:shipcret/widgets/bottom_menu/bottom_menu_bar.dart';
import 'package:shipcret/widgets/home/home_sub_page.dart';
import 'package:shipcret/widgets/notification/notification_sub_page.dart';
import 'package:shipcret/widgets/search/search_sub_page.dart';
import 'package:shipcret/widgets/message/message_sub_page.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FPlaygroundPage extends ConsumerWidget {
  const FPlaygroundPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);

    return Scaffold(
      body: _getPage(appState.getPageIndex()),
      bottomNavigationBar: const FBottomMenuBar(),
    );
  }

  Widget _getPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return const HomeSubPage();
      case 1:
        return const SearchSubPage();
      case 2:
        return const NotificationSubPage();
      case 3:
        return const MessageSubPage();
    }

    return const HomeSubPage();
  }
}
