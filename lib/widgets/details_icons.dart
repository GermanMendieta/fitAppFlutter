import 'package:fitapp/widgets/item_trait.dart';
import 'package:flutter/material.dart';

class DetailsIcons extends StatelessWidget {
  const DetailsIcons({super.key, required this.flags});

  final List<String> flags;

  @override
  Widget build(BuildContext context) {
    IconData complexityIcon;
    List<List<String>> formatTitles = [
      ['Beginers', 'Experts'],
      ['No need', 'Needed'],
      ['Intence', 'Normal'],
      ['Impact', 'Low']
    ];

    switch (flags[1]) {
      case 'easy':
        flags[1] = 'Easy';
        complexityIcon = Icons.eco;
        break;
      case 'medium':
        flags[1] = 'Medium';
        complexityIcon = Icons.local_fire_department_outlined;
        break;
      case 'hard':
        flags[1] = 'Hard';
        complexityIcon = Icons.local_fire_department_rounded;
        break;
      default:
        complexityIcon = Icons.time_to_leave;
    }

    Widget content = Container(
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          ExerciseTrait(icon: Icons.timer_outlined, label: flags[0]), // time
          ExerciseTrait(icon: complexityIcon, label: flags[1]), // Complexitie
          ExerciseTrait(
              icon: flags[2].compareTo('true') == 0
                  ? Icons.bedroom_baby
                  : Icons.home_repair_service_outlined,
              label: flags[2].compareTo('true') == 0
                  ? formatTitles[0][0]
                  : formatTitles[0][1]), // is for Beginner
          ExerciseTrait(
              icon: Icons.fitness_center_rounded,
              label: flags[3].compareTo('true') == 0
                  ? formatTitles[1][0]
                  : formatTitles[1][1]), // is needed equipment
          ExerciseTrait(
              icon: Icons.offline_bolt_rounded,
              label: flags[4].compareTo('true') == 0
                  ? formatTitles[2][0]
                  : formatTitles[2][1]), // is high intensity
          ExerciseTrait(
              icon: Icons.directions_run,
              label: flags[5].compareTo('true') == 0
                  ? formatTitles[3][0]
                  : formatTitles[3][1]), // is low impact
        ],
      ),
    );

    return content;
  }
}
