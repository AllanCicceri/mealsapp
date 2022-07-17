import 'package:flutter/material.dart';
import 'package:meal/components/category_component.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Itadaki'),
      ),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisExtent: 20,
          ),
          children: DUMMY_CATEGORIES.map((cat) {
            return CategoryComponent(cat);
          }).toList()),
    );
  }
}
