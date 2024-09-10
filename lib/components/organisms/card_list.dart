import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../molecules/card_item.dart';
import '../molecules/filter_bar.dart';
import '../molecules/search_bar.dart';
import '../../providers/card_provider.dart';
import '../atoms/app_style.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String? selectedType;
  String? selectedRace;
  String? selectedArchetype;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    Provider.of<CardProvider>(context, listen: false).loadMoreCards();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      Provider.of<CardProvider>(context, listen: false).loadMoreCards();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    final filteredCards = cardProvider.cards.where((card) {
      final matchesSearchQuery =
          card.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesType = selectedType == null || card.type == selectedType;
      final matchesRace = selectedRace == null || card.race == selectedRace;
      final matchesArchetype =
          selectedArchetype == null || card.archetype == selectedArchetype;

      return matchesSearchQuery &&
          matchesType &&
          matchesRace &&
          matchesArchetype;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Cartas'),
        backgroundColor: AppStyle.primaryColor,
      ),
      body: Column(
        children: [
          // Barra de filtros
          FilterBar(
            selectedType: selectedType,
            selectedRace: selectedRace,
            selectedArchetype: selectedArchetype,
            onTypeChanged: (value) {
              setState(() {
                selectedType = value;
              });
            },
            onRaceChanged: (value) {
              setState(() {
                selectedRace = value;
              });
            },
            onArchetypeChanged: (value) {
              setState(() {
                selectedArchetype = value;
              });
            },
          ),
          CustomSearchBar(
            searchController: _searchController,
            onSearch: (query) {
              setState(() {
                _searchQuery = query;
              });
            },
          ),
          Expanded(
            child: cardProvider.cards.isEmpty && cardProvider.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller: _scrollController,
                    itemCount:
                        filteredCards.length + (cardProvider.loading ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == filteredCards.length) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return CardItem(card: filteredCards[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }
}
