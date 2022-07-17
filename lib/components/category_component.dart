import 'package:flutter/material.dart';
import 'package:meal/models/category.dart';

class CategoryComponent extends StatelessWidget {
  final Category category;

  const CategoryComponent(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(category.title),
    );
  }
}
