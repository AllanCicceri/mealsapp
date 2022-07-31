import 'package:flutter/material.dart';

import '../models/recipe.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Recipe> listOfFavorites;

  FavoritesScreen(this.listOfFavorites, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listOfFavorites.map((e) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 6,
              child: Column(
                children: [
                  Image.network(e.imageUrl, fit: BoxFit.cover),
                  Text(e.title),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
