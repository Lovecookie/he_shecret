import 'package:shipcret/common/common_assets.dart';

import 'dart:ui';
import 'package:flutter/material.dart';

class FBackgroundImageWidget extends StatefulWidget {
  final Widget child;

  const FBackgroundImageWidget({super.key, required this.child});

  @override
  State<FBackgroundImageWidget> createState() => _FBackgroundImageWidgetState();
}

class _FBackgroundImageWidgetState extends State<FBackgroundImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(FCommonAssets.dreamShip3), fit: BoxFit.cover),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [
            const Color.fromARGB(255, 242, 252, 96).withOpacity(0.5),
            const Color.fromARGB(255, 227, 85, 156).withOpacity(0.3),
            Colors.lightBlue.withOpacity(0.1),
          ])),
          child: widget.child,
        ),
      ),
    );
  }
}
