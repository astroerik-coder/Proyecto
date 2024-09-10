import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int? maxLines;
  final TextOverflow? overflow;

  const StyledText({
    Key? key,
    required this.text,
    required this.style,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
