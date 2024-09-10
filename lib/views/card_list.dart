import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/card_provider.dart';
import '../components/molecules/card_item.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Añadimos un listener para detectar cuando el scroll llegue al final
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        Provider.of<CardProvider>(context, listen: false).loadMoreCards();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Listado de Cartas')),
      body: cardProvider.cards.isEmpty && cardProvider.loading
          ? Center(
              child:
                  CircularProgressIndicator()) // Muestra un indicador de carga inicial
          : ListView.builder(
              controller: _scrollController,
              itemCount:
                  cardProvider.cards.length + (cardProvider.loading ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == cardProvider.cards.length) {
                  return Center(
                      child:
                          CircularProgressIndicator()); // Indicador de carga cuando se cargan más
                }
                return CardItem(card: cardProvider.cards[index]);
              },
            ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
