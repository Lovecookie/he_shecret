import 'dart:ui';
import 'package:flutter/material.dart';

class FBackgroundImageWidget extends StatefulWidget {
  final Widget child;
  final ImageProvider image;
  final double? width;
  final double? height;

  const FBackgroundImageWidget({super.key, required this.child, required this.image, this.width, this.height});

  @override
  State<FBackgroundImageWidget> createState() => _FBackgroundImageWidgetState();
}

class _FBackgroundImageWidgetState extends State<FBackgroundImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.width ?? double.infinity,
      width: widget.height ?? double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: widget.image, fit: BoxFit.cover),
      ),
      child: widget.child,
      // child: BackdropFilter(
      //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      //   child: Container(
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [
      //       const Color.fromARGB(255, 243, 243, 18).withOpacity(0.5),
      //       const Color.fromARGB(255, 245, 31, 138).withOpacity(0.3),
      //       Colors.lightBlue.withOpacity(0.3),
      //     ])),
      //     child: widget.child,
      //   ),
      // ),
    );
  }
}

class FBackgroundBlurWidget extends StatefulWidget {
  final Widget child;
  final ImageProvider image;
  final double? width;
  final double? height;

  const FBackgroundBlurWidget({super.key, required this.child, required this.image, this.width, this.height});

  @override
  State<FBackgroundBlurWidget> createState() => _FBackgroundBlurWidgetState();
}

class _FBackgroundBlurWidgetState extends State<FBackgroundBlurWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.width ?? double.infinity,
      width: widget.height ?? double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: widget.image, fit: BoxFit.cover),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [
            const Color.fromARGB(255, 243, 243, 18).withOpacity(0.5),
            const Color.fromARGB(255, 245, 31, 138).withOpacity(0.3),
            Colors.lightBlue.withOpacity(0.3),
          ])),
          child: widget.child,
        ),
      ),
    );
  }
}
