import 'package:shipcret/provider/state_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaygroundAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final Size barHeight = const Size.fromHeight(56.0);
  final PreferredSizeWidget? bottomWidget;
  final Widget? leadingIcon;
  final List<Widget>? actionIcons;
  final double? toolbarHeight;

  const PlaygroundAppBar({
    super.key,
    this.bottomWidget,
    this.leadingIcon,
    this.actionIcons,
    this.toolbarHeight,
  });

  @override
  Size get preferredSize => barHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageName = ref.watch(pageNameProvider);

    return AppBar(
      toolbarHeight: toolbarHeight ?? 50.0,
      // shadowColor: Colors.green.shade200,
      // elevation: 0.3,
      // bottom: bottomWidget ?? _bottomWidget(),
      leading: leadingIcon,
      actions: actionIcons,
    );
  }

  PreferredSizeWidget _bottomWidget() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.yellow.shade200,
              Colors.green,
              Colors.yellow.shade200,
            ],
          ),
        ),
        height: 1.0,
      ),
    );
  }
}
