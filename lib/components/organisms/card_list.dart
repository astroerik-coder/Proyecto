import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../molecules/card_item.dart';
import '../molecules/filter_bar.dart';
import '../molecules/search_bar.dart';
import '../../providers/card_provider.dart';
import '../atoms/app_style.dart';
import '../atoms/floating_action_button_atom.dart';

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

  void _resetFilters() {
    setState(() {
      selectedType = null;
      selectedRace = null;
      selectedArchetype = null;
      _searchController.clear();
      _searchQuery = '';
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02,
              vertical: screenHeight * 0.01,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomSearchBar(
                    searchController: _searchController,
                    onSearch: (query) {
                      setState(() {
                        _searchQuery = query;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                IconButton(
                  onPressed: _resetFilters,
                  icon: const Icon(Icons.refresh, color: AppStyle.accentColor),
                  tooltip: 'Resetear filtros',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Cartas cargadas: ${filteredCards.length}',
              style: TextStyle(
                color: AppStyle.textColor.withOpacity(0.7),
                fontSize: 14.0,
              ),
            ),
          ),

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
          // Lista de cartas
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
      floatingActionButton: FloatingActionButtonAtom(
        onPressed: _scrollToTop,
        icon: Icons.arrow_upward,
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
