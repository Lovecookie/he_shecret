import 'package:shipcret/common/common_const.dart';
import 'package:shipcret/material-theme/common_color.dart';
import 'package:shipcret/providers/state_provider.dart';
import 'package:shipcret/theme/app_icon.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FBottomMenuBar extends HookConsumerWidget {
  const FBottomMenuBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var appState = ref.watch(appStateProvider);

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
    int i = 0;

    return <Widget>[
      _makeIcon(
        context: context,
        ref: ref,
        pageIndex: i++,
        iconWidget: FAppIcon.home(),
      ),
      _makeIcon(
        context: context,
        ref: ref,
        pageIndex: i++,
        iconWidget: FAppIcon.search(),
      ),
      _makeIcon(
        context: context,
        ref: ref,
        pageIndex: i++,
        iconWidget: FAppIcon.notification(),
      ),
      _makeIcon(
        context: context,
        ref: ref,
        pageIndex: i++,
        iconWidget: FAppIcon.message(),
      ),
    ];
  }

  Widget _makeIcon({
    required BuildContext context,
    required WidgetRef ref,
    required int pageIndex,
    required Widget iconWidget,
  }) {
    final bool selected = ref.watch(appStateProvider.notifier).getPageIndex() == pageIndex;

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
                ref.watch(appStateProvider.notifier).setPageIndex(pageIndex);
              },
            ),
          ),
        ),
      ),
    );
  }
}
