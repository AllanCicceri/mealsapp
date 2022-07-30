import 'package:flutter/material.dart';
import 'package:meal/models/filters_model.dart';
import 'package:meal/screens/category_recipes_screen.dart';
import 'package:meal/screens/recipe_details.dart';
import 'package:meal/screens/settings_screen.dart';
import 'package:meal/screens/tabs_screen.dart';
import 'package:meal/util/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FiltersModel filters = FiltersModel();

  _setFilters(FiltersModel settingsFilters) {
    setState(() {
      filters = settingsFilters;
      print('filt: ${filters.isGlutenFree}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        primaryColor: Colors.pink,
        accentColor: Colors.amber.shade400,
        fontFamily: 'Raleway',
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (context) => const TabsScreen(),
        AppRoutes.CATEGORY_RECIPES: (context) => CategoryRecipesScreen(filters),
        AppRoutes.RECIPE_DETAILS: (context) => const RecipeDetails(),
        AppRoutes.SETTINGS: (context) =>
            SettingsScreen((filters) => _setFilters(filters), filters),
      },
    );
  }
}
