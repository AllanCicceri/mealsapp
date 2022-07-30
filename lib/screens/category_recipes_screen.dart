import 'package:flutter/material.dart';
import 'package:meal/components/recipe_item.dart';
import 'package:meal/data/dummy_data.dart';
import 'package:meal/models/category.dart';
import 'package:meal/models/filters_model.dart';

class CategoryRecipesScreen extends StatelessWidget {
  FiltersModel filters = FiltersModel();

  CategoryRecipesScreen(this.filters, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('filtering: ${filters.isGlutenFree}');
    print('filtering: ${filters.isVegan}');
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryRecipes = DUMMY_RECIPES
        .where((recipe) => recipe.categories.contains(category.id))
        .toList();

    final categoryRecipesFiltered = categoryRecipes.where((recipe) {
      final filterGluten = !(!recipe.isGlutenFree && filters.isGlutenFree);
      final filterLactose = !(!recipe.isLactoseFree && filters.isLactoseFree);
      final filterVegan = !(!recipe.isVegan && filters.isVegan);
      final filterVegetarian = !(!recipe.isVegetarian && filters.isVegetarian);

      return filterGluten && filterLactose && filterVegan && filterVegetarian;
    }).toList();

    return Scaffold(
        appBar: AppBar(title: Text(category.title)),
        body: ListView.builder(
            itemCount: categoryRecipesFiltered.length,
            itemBuilder: (context, index) {
              return RecipeItem(categoryRecipesFiltered[index]);
            }));
  }
}
