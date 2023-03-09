import 'package:flutter/material.dart';
import 'package:shipcret/widgets/common/common_icon_button.dart';

class FOverlappedAppBar extends StatelessWidget {
  const FOverlappedAppBar({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: AppBar(
          toolbarHeight: 45.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: FIconButton.createFeedWidgetIcon(
            icon: const Icon(Icons.menu),
            selectedIcon: const Icon(Icons.menu_open_outlined),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
