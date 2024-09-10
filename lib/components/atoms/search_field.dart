import 'package:flutter/material.dart';
import 'app_style.dart';
import 'dart:async'; // Para el debounce

class CustomSearchField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onChanged;
  final String hintText;
  final IconData? prefixIcon;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final OutlineInputBorder? borderStyle;
  final Duration debounceDuration;

  const CustomSearchField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.hintText = 'Buscar...',
    this.prefixIcon,
    this.fillColor,
    this.hintStyle,
    this.borderStyle,
    this.debounceDuration = const Duration(milliseconds: 300),
  });

  @override
  _CustomSearchFieldState createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(widget.debounceDuration, () {
      widget.onChanged(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: _onSearchChanged,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyle(color: AppStyle.textColor.withOpacity(0.5)),
        filled: true,
        fillColor: widget.fillColor ?? AppStyle.secondaryColor.withOpacity(0.3),
        prefixIcon: Icon(widget.prefixIcon ?? Icons.search,
            color: AppStyle.accentColor),
        border: widget.borderStyle ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
      ),
      style: const TextStyle(color: AppStyle.textColor),
    );
  }
}
