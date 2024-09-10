import 'package:flutter/material.dart';
import '../atoms/search_field.dart';

class CustomSearchBar extends StatelessWidget {
  // Cambiamos el nombre de SearchBar a CustomSearchBar
  final TextEditingController searchController;
  final Function(String) onSearch;

  const CustomSearchBar({
    Key? key,
    required this.searchController,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: CustomSearchField(
        controller: searchController,
        onChanged: onSearch,
      ),
    );
  }
}
