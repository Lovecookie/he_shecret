import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FIconButton extends StatefulWidget {
  final Icon icon;
  final Icon selectedIcon;
  final VoidCallback onPressed;

  const FIconButton({super.key, required this.onPressed, required this.icon, required this.selectedIcon});

  @override
  State<FIconButton> createState() => _FIconButtonState();

  FIconButton.createFeedWidgetIcon(
      {super.key, required this.onPressed, required this.icon, required this.selectedIcon}) {
    FIconButton(
      onPressed: onPressed,
      icon: icon,
      selectedIcon: selectedIcon,
    );
  }
}

class _FIconButtonState extends State<FIconButton> {
  late bool _isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: IconButton(
        onPressed: () {
          setState(() {
            _isSelected = !_isSelected;
          });
          widget.onPressed();
        },
        icon: widget.icon,
        selectedIcon: widget.selectedIcon,
        isSelected: _isSelected,
        color: Colors.black54,
      ),
    );
  }
}
