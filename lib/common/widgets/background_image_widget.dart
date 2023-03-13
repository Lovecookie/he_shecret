import 'dart:ui';
import 'package:flutter/material.dart';

class FBackgroundImageWidget extends StatefulWidget {
  final Widget? child;
  final ImageProvider image;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  const FBackgroundImageWidget(
      {super.key, required this.image, this.child, this.width, this.height, this.borderRadius});

  @override
  State<FBackgroundImageWidget> createState() => _FBackgroundImageWidgetState();
}

class _FBackgroundImageWidgetState extends State<FBackgroundImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? double.infinity,
      width: widget.width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        image: DecorationImage(
          image: widget.image,
          fit: BoxFit.cover,
        ),
      ),
      child: widget.child,
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

class FBackgroundStackBlurWidget extends StatefulWidget {
  final Widget child;
  final ImageProvider image;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final bool isGradiant;

  const FBackgroundStackBlurWidget(
      {super.key,
      required this.image,
      this.width,
      this.height,
      required this.child,
      this.borderRadius,
      this.isGradiant = false});

  @override
  State<FBackgroundStackBlurWidget> createState() => _FBackgroundStackBlurWidgetState();
}

class _FBackgroundStackBlurWidgetState extends State<FBackgroundStackBlurWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: widget.image, fit: BoxFit.fitWidth, filterQuality: FilterQuality.low),
        color: Colors.black,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Container(
          decoration: widget.isGradiant ? _withGradiant() : _whiteDecoration(),
          child: widget.child,
        ),
      ),
    );
  }

  BoxDecoration _whiteDecoration() {
    return BoxDecoration(
      color: Colors.white.withOpacity(0.4),
    );
  }

  BoxDecoration _withGradiant() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.black.withOpacity(0.85),
          Colors.black.withOpacity(0.4),
          Colors.black.withOpacity(0.1),
          Colors.black.withOpacity(0.0),
          Colors.black.withOpacity(0.1),
          Colors.black.withOpacity(0.4),
          Colors.black.withOpacity(0.85),
        ],
      ),
    );
  }
}
