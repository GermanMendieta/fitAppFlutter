import 'package:flutter/material.dart';

class ExerciseTrait extends StatelessWidget {
  const ExerciseTrait({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 3),
      width: 62,
      child: Column(
        children: [
          Icon(icon),
          const SizedBox(width: 6),
          Text(
            label,
            softWrap: true,
            overflow: TextOverflow.clip,
            maxLines: 1,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
