import 'package:flutter/material.dart';
import 'package:meal/models/recipe.dart';

class RecipeDetails extends StatelessWidget {
  const RecipeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipe = ModalRoute.of(context)!.settings.arguments as Recipe;

    return Scaffold(
      appBar: AppBar(title: Text(recipe.title)),
      body: Center(child: Text('Recipe details')),
    );
  }
}
