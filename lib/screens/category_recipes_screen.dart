import 'package:flutter/material.dart';
import 'package:meal/models/category.dart';

class CategoryRecipesScreen extends StatelessWidget {
  final Category category;

  const CategoryRecipesScreen(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: const Center(
        child: Text('You' 're at Category Recipes Screen'),
      ),
    );
  }
}
