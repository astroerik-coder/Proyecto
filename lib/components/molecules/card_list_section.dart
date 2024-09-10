import 'package:flutter/material.dart';
import '../atoms/app_style.dart';
import '../atoms/styled_text.dart';
import '../atoms/card_info_container_atom.dart';

class CardListSection extends StatelessWidget {
  final String title;
  final List<String> items;

  const CardListSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.cardTitleStyle.copyWith(
            fontSize: 18.0,
            color: AppStyle.accentColor,
          ),
        ),
        Divider(color: Colors.grey[300], height: 20.0),
        CardInfoContainerAtom(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: StyledText(
                  text: item,
                  style: AppStyle.cardDescriptionStyle,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
