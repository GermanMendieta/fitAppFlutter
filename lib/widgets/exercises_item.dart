import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/screens/exercise_detail.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Exercisesitem extends StatelessWidget {
  const Exercisesitem({
    super.key,
    required this.exercise,
    required this.setFavoriteController,
    required this.favoritesList,
  });

  final Exercise exercise;
  final void Function(Exercise) setFavoriteController;
  final List<Exercise> favoritesList;

  void openDetailExercise(BuildContext contex, Exercise exerc) {
    Navigator.push(
      contex,
      MaterialPageRoute(
        builder: (context) => ExerciseDetailScreen(
          exercise: exercise,
          setFavoriteController: setFavoriteController,
          favoritesList: favoritesList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          // open detail of category
          openDetailExercise(context, exercise);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(exercise.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      exercise.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icons of details
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
