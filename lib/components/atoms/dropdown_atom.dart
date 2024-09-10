import 'package:flutter/material.dart';
import '../atoms/app_style.dart';

class DropdownAtom extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> items;
  final Function(String?) onChanged;
  final Color? dropdownColor;
  final Color? iconColor;
  final Color? textColor;

  const DropdownAtom({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.onChanged,
    this.dropdownColor,
    this.iconColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: AppStyle.secondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: value,
        hint: Text(hint,
            style: TextStyle(
                color: textColor ?? AppStyle.textColor.withOpacity(0.5))),
        dropdownColor:
            dropdownColor ?? AppStyle.primaryColor, // Fondo oscuro por defecto
        iconEnabledColor: iconColor ?? AppStyle.accentColor, // Color del ícono
        underline: const SizedBox.shrink(), // Elimina la línea subrayada
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item,
                style: TextStyle(color: textColor ?? AppStyle.textColor)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
