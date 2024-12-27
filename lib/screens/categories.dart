import 'package:fitapp/models/category.dart';
import 'package:fitapp/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      children: categories
          .map(
            (oneCategory) => CategoryItem(
              category: oneCategory,
            ),
          )
          .toList(),
    );
  }
}
