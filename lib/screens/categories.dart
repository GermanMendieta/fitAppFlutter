import 'package:fitapp/models/category.dart';
import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/screens/exercises.dart';
import 'package:fitapp/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.categories,
    required this.setFavoriteController,
    required this.favoritesList,
    required this.availableExercise,
  });

  final List<Category> categories;
  final void Function(Exercise) setFavoriteController;
  final List<Exercise> favoritesList;
  final List<Exercise> availableExercise;

  void _openCategoryView(BuildContext context, Category selectedCategory) {
    List<Exercise> exercisesFromCategory = availableExercise
        .where(
          (element) => element.categories.contains(selectedCategory.id),
        )
        .toList();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ExercisesScreen(
        exercises: exercisesFromCategory,
        favoritesList: favoritesList,
        setFavoriteController: setFavoriteController,
        title: selectedCategory.title,
      ),
    ));
  }

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
              openCategoryView: _openCategoryView,
            ),
          )
          .toList(),
    );
  }
}
