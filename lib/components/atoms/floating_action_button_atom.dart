import 'package:flutter/material.dart';

class FloatingActionButtonAtom extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;

  const FloatingActionButtonAtom({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.purple,
      child: Icon(icon, color: Colors.white),
    );
  }
}
