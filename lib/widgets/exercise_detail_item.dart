import 'package:flutter/material.dart';

class ExerciseDetailItem extends StatelessWidget {
  const ExerciseDetailItem({
    super.key,
    required this.textTitle,
    required this.textDetail,
    this.icon = const Icon(Icons.no_accounts_outlined),
  });

  final String textTitle;
  final String textDetail;
  final Icon icon;

  Widget _createIconDetail(Icon icon){
    if (icon == const Icon(Icons.no_accounts_outlined)) {
      
    }

    return const SizedBox(width: 5);
  }


  @override
  Widget build(BuildContext context) {
    Widget content;
    if (textDetail.contains('N/A')) {
      content = Row(
        children: [
          _createIconDetail(icon),
          Text(
            '$textTitle:',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(width: 5),
          Text(
            'Not apply',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ],
      );
    } else {
      content = Row(
        children: [
          const SizedBox(width: 5),
          Text(
            '$textTitle:',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(width: 5),
          Text(
            textDetail,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ],
      );
    }

    return content;
  }
}
