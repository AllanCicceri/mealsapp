import 'package:flutter/material.dart';

class CategoryRecipesScreen extends StatelessWidget {
  const CategoryRecipesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('This Category Recipes')),
      body: const Center(
        child: Text('You' 're at Category Recipes Screen'),
      ),
    );
  }
}
