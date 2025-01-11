import 'package:fitapp/data/dummy_data.dart';
import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/widgets/details_icons.dart';
import 'package:fitapp/widgets/exercise_detail_item.dart';
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
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [
              Image.network(
                thisExercise.imageUrl,
                width: double.infinity,
                height: 260,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 20),
              DetailsIcons(flags: [
                '${thisExercise.duration} min',
                thisExercise.complexity.name.toString(),
                thisExercise.isBeginnerFriendly.toString(),
                thisExercise.isNoEquipmentNeeded.toString(),
                thisExercise.isHighIntensity.toString(),
                thisExercise.isLowImpact.toString(),
              ]),
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
              const SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      'Categories: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    ...thisExercise.categories.map(
                      (e) {
                        String categoryName = dummyCategories.where((element) => element.id.compareTo(e) == 0).first.title;
                        return Text(categoryName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.normal,
                                ));
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              ExerciseDetailItem(
                textTitle: 'Repetitions',
                textDetail: thisExercise.repetitions,
              ),
              const SizedBox(height: 5),
              ExerciseDetailItem(
                textTitle: 'Recomende sets',
                textDetail: thisExercise.sets,
              ),
              const SizedBox(height: 5),
              ExerciseDetailItem(
                textTitle: 'Duration',
                textDetail: thisExercise.duration.toString(),
              ),
              const SizedBox(height: 5),
              ExerciseDetailItem(
                textTitle: 'Complexity',
                textDetail: thisExercise.complexity.name.toString(),
              ),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}
