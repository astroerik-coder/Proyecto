import 'package:flutter/material.dart';
import 'package:yugioh/components/atoms/dropdown_atom.dart';

class FilterBar extends StatelessWidget {
  final String? selectedType;
  final String? selectedRace;
  final String? selectedArchetype;
  final Function(String?) onTypeChanged;
  final Function(String?) onRaceChanged;
  final Function(String?) onArchetypeChanged;

  const FilterBar({
    super.key,
    this.selectedType,
    this.selectedRace,
    this.selectedArchetype,
    required this.onTypeChanged,
    required this.onRaceChanged,
    required this.onArchetypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownAtom(
            hint: 'Type',
            value: selectedType,
            items: const ['Spell Card', 'Trap Card', 'Monster Card'],
            onChanged: onTypeChanged,
          ),
          DropdownAtom(
            hint: 'Race',
            value: selectedRace,
            items: const ['Continuous', 'Quick-Play', 'Normal', 'Effect'],
            onChanged: onRaceChanged,
          ),
          DropdownAtom(
            hint: 'Archetype',
            value: selectedArchetype,
            items: const ['Alien', 'Dragon', 'Spellcaster', 'Warrior'],
            onChanged: onArchetypeChanged,
          ),
        ],
      ),
    );
  }
}
