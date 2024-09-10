import 'package:flutter/material.dart';
import 'app_style.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Buscar cartas...',
        hintStyle: TextStyle(color: AppStyle.textColor.withOpacity(0.5)),
        filled: true,
        fillColor: AppStyle.secondaryColor.withOpacity(0.3),
        prefixIcon: Icon(Icons.search, color: AppStyle.accentColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(color: AppStyle.textColor),
    );
  }
}
