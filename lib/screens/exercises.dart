import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/widgets/exercises_item.dart';
import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({
    super.key,
    required this.exercises,
    this.title,
    required this.setFavoriteController,
    required this.favoritesList,
  });

  final List<Exercise> exercises;
  final String? title;
  final void Function(Exercise) setFavoriteController;
  final List<Exercise> favoritesList;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: exercises.length,
      itemBuilder: (ctx, index) => Exercisesitem(
        exercise: exercises[index],
        setFavoriteController: setFavoriteController,
        favoritesList: favoritesList,
      ),
    );

    if (exercises.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Try selecting a different category',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            )
          ],
        ),
      );
    }

    if (title == null) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
