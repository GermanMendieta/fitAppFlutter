import 'package:fitapp/models/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseDetailScreen extends StatefulWidget {
  const ExerciseDetailScreen({
    super.key,
    required this.exercise,
    required this.setFavoriteController,
    required this.favoritesList,
  });

  final Exercise exercise;
  final void Function(Exercise) setFavoriteController;
  final List<Exercise> favoritesList;

  @override
  State<StatefulWidget> createState() {
    return _ExerciseDetailScreenState();
  }
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  late bool favoriteController;
  late Exercise thisExercise;

  @override
  void initState() {
    super.initState();
    thisExercise = widget.exercise;
    favoriteController = widget.favoritesList.contains(thisExercise);
  }

  void setFavorite(Exercise exercise) {
    widget.setFavoriteController(exercise);
    setState(() {
      favoriteController = !favoriteController;
    });
  }

  @override
  Widget build(BuildContext context) {
    var iconStar = favoriteController
        ? const Icon(Icons.star)
        : const Icon(Icons.star_outline);

    return Scaffold(
      appBar: AppBar(
        title: Text(thisExercise.title),
        actions: [
          IconButton(
            onPressed: () {
              setFavorite(thisExercise);
            },
            icon: iconStar,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              thisExercise.imageUrl,
              width: double.infinity,
              height: 260,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              'Description:',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 5),
            Text(
              thisExercise.description,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
