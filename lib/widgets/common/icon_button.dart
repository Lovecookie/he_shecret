import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FIconButton extends StatefulWidget {
  final Icon icon;
  final Icon? selectedIcon;
  final bool isBackground;
  final VoidCallback onPressed;

  const FIconButton(
      {super.key, required this.onPressed, required this.icon, this.selectedIcon, this.isBackground = false});

  @override
  State<FIconButton> createState() => _FIconButtonState();
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
    return widget.isBackground ? _withBackground(context) : _withoutBackground(context);
  }

  Widget _withoutBackground(BuildContext context) {
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

  Widget _withBackground(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 44, 44, 44).withOpacity(0.4),
        borderRadius: BorderRadius.circular(15.0),
      ),
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
