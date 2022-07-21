import 'package:flutter/material.dart';
import 'package:meal/components/recipe_item.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/category.dart';

class CategoryRecipesScreen extends StatelessWidget {
  const CategoryRecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryRecipes = DUMMY_RECIPES
        .where((recipe) => recipe.categories.contains(category.id))
        .toList();

    return Scaffold(
        appBar: AppBar(title: Text(category.title)),
        body: ListView.builder(
            itemCount: categoryRecipes.length,
            itemBuilder: (context, index) {
              return RecipeItem(categoryRecipes[index]);
            }));
  }
}
