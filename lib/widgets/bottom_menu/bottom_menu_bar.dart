import 'package:shipcret/common/common_const.dart';
import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/providers/state_provider.dart';
import 'package:shipcret/theme/app_icon.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shipcret/widgets/common/widget_enum.dart';

// ignore: must_be_immutable
class FBottomMenuBar extends ConsumerWidget {
  late ESubPage currentSubPage;

  FBottomMenuBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);
    currentSubPage = appState.getSubPage();

    return SafeArea(
      child: Container(
        height: 60,
        decoration: const BoxDecoration(
          color: FCommonColor.mattBlack,
        ),
        child: Row(
          children: _bottomBarIcons(context, ref),
        ),
      ),
    );
  }

  List<Widget> _bottomBarIcons(
    BuildContext context,
    WidgetRef ref,
  ) {
    return <Widget>[
      _makeIcon(
        context: context,
        ref: ref,
        subPage: ESubPage.home,
        iconWidget: FAppIcon.home(),
      ),
      _makeIcon(
        context: context,
        ref: ref,
        subPage: ESubPage.search,
        iconWidget: FAppIcon.search(),
      ),
      _makeIcon(
        context: context,
        ref: ref,
        subPage: ESubPage.notification,
        iconWidget: FAppIcon.notification(),
      ),
      _makeIcon(
        context: context,
        ref: ref,
        subPage: ESubPage.message,
        iconWidget: FAppIcon.message(),
      ),
    ];
  }

  Widget _makeIcon({
    required BuildContext context,
    required WidgetRef ref,
    required ESubPage subPage,
    required Widget iconWidget,
  }) {
    // final bool selected = ref.watch(appStateProvider.notifier).getSubPage() == subPage;
    final bool selected = currentSubPage == subPage;

    return Expanded(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: AnimatedAlign(
          duration: const Duration(milliseconds: CommonConst.animDuration),
          curve: Curves.easeIn,
          alignment: const Alignment(0, CommonConst.iconOn),
          child: AnimatedOpacity(
            opacity: CommonConst.alphaOn,
            duration: const Duration(milliseconds: CommonConst.animDuration),
            child: IconButton(
              color: selected ? FCommonColor.subPrimaryBlack : FCommonColor.subPrimaryWhite,
              padding: const EdgeInsets.all(0),
              alignment: const Alignment(0, 0),
              icon: iconWidget,
              onPressed: () {
                ref.watch(appStateProvider.notifier).setSubPage(subPage);
              },
            ),
          ),
        ),
      ),
    );
  }
}
