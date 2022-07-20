import 'package:flutter/material.dart';
import 'package:meal/models/category.dart';

class CategoryRecipesScreen extends StatelessWidget {
  const CategoryRecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: const Center(
        child: Text('You' 're at Category Recipes Screen'),
      ),
    );
  }
}
