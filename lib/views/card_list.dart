import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/card_provider.dart';
import '../components/molecules/card_item.dart';
import '../components/molecules/filter_bar.dart';
import '../components/atoms/app_style.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Variables para los filtros
  String? selectedType;
  String? selectedRace;
  String? selectedArchetype;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
        _onScroll); // Escucha los eventos de scroll para cargar más elementos cuando llegue al final
    Provider.of<CardProvider>(context, listen: false)
        .loadMoreCards(); // Carga inicial
  }

  // Este método escucha el scroll y carga más cartas cuando se llega al final del scroll
  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent) {
      Provider.of<CardProvider>(context, listen: false)
          .loadMoreCards(); // Cargar más cartas
    }
  }

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    // Filtrar las cartas en base a la búsqueda y los filtros seleccionados
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
        title: Text('Listado de Cartas'),
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
          // Campo de búsqueda
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar cartas...',
                  hintStyle:
                      TextStyle(color: AppStyle.textColor.withOpacity(0.5)),
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
                ),
                onChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
                },
                style: TextStyle(color: AppStyle.textColor),
              ),
            ),
          ),
          Expanded(
            child: cardProvider.cards.isEmpty && cardProvider.loading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    controller:
                        _scrollController, // Controlador de scroll para detectar cuando llegamos al final
                    itemCount: filteredCards.length +
                        (cardProvider.loading
                            ? 1
                            : 0), // Añadimos un item extra si estamos cargando más
                    itemBuilder: (context, index) {
                      if (index == filteredCards.length) {
                        return Center(
                            child:
                                CircularProgressIndicator()); // Muestra el indicador de carga al final
                      }
                      return CardItem(
                          card: filteredCards[
                              index]); // Renderizamos las cartas filtradas
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
