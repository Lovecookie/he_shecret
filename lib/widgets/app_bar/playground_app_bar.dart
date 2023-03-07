import 'package:shipcret/common/common_function.dart';
import 'package:shipcret/provider/state_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shipcret/widgets/custom_widget.dart';

class PlaygroundAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final Size barHeight = const Size.fromHeight(56.0);
  final PreferredSizeWidget? bottomWidget;
  final Widget? leadingIcon;
  final List<Widget>? actionIcons;

  const PlaygroundAppBar({
    super.key,
    this.bottomWidget,
    this.leadingIcon,
    this.actionIcons,
  });

  @override
  Size get preferredSize => barHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageName = ref.watch(pageNameProvider);

    return AppBar(
      title: customText(
        pageName,
        context: context,
        style: TextStyle(
          fontSize: 20,
          color: ownerColorScheme(context).primary,
        ),
      ),
      // shadowColor: Colors.green.shade200,
      // elevation: 0.3,
      bottom: bottomWidget ?? _bottomWidget(),
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
