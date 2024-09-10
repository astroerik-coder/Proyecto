import 'package:flutter/material.dart';
import '../atoms/app_style.dart';

class CardInfoContainerAtom extends StatelessWidget {
  final Widget child;

  const CardInfoContainerAtom({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppStyle.secondaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
