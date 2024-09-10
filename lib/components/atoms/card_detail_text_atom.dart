import 'package:flutter/material.dart';
import '../atoms/app_style.dart';

class CardDetailTextAtom extends StatelessWidget {
  final String label;
  final String? value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  const CardDetailTextAtom({
    super.key,
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
  });

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$label: ",
            style: labelStyle ?? AppStyle.cardTitleStyle,
          ),
          Flexible(
            child: Text(
              value!,
              style: valueStyle ?? AppStyle.cardDescriptionStyle,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
