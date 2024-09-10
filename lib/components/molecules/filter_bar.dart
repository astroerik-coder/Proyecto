import 'package:flutter/material.dart';
import '../atoms/app_style.dart';

class FilterBar extends StatelessWidget {
  final String? selectedType;
  final String? selectedRace;
  final String? selectedArchetype;
  final Function(String?) onTypeChanged;
  final Function(String?) onRaceChanged;
  final Function(String?) onArchetypeChanged;

  const FilterBar({
    Key? key,
    this.selectedType,
    this.selectedRace,
    this.selectedArchetype,
    required this.onTypeChanged,
    required this.onRaceChanged,
    required this.onArchetypeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildDropdown('Type', selectedType,
              ['Spell Card', 'Trap Card', 'Monster Card'], onTypeChanged),
          _buildDropdown('Race', selectedRace,
              ['Continuous', 'Quick-Play', 'Normal', 'Effect'], onRaceChanged),
          _buildDropdown(
              'Archetype',
              selectedArchetype,
              ['Alien', 'Dragon', 'Spellcaster', 'Warrior'],
              onArchetypeChanged),
        ],
      ),
    );
  }

  Widget _buildDropdown(String hint, String? value, List<String> items,
      Function(String?) onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: AppStyle.secondaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
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
            style: TextStyle(color: AppStyle.textColor.withOpacity(0.5))),
        dropdownColor: AppStyle.primaryColor, // Fondo oscuro del dropdown
        iconEnabledColor: AppStyle.accentColor,
        underline: SizedBox.shrink(), // Elimina la línea subrayada del dropdown
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: TextStyle(color: AppStyle.textColor)),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
