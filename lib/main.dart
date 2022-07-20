import 'package:flutter/material.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/category_recipes_screen.dart';
import 'package:meal/util/app_routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
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
        AppRoutes.HOME: (context) => const CategoriesScreen(),
        AppRoutes.CATEGORY_RECIPES: (context) => CategoryRecipesScreen(),
      },
    );
  }
}
