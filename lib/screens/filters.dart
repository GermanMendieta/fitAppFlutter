import 'package:flutter/material.dart';

enum Filter {
  isBeginnerFriendly,
  isNoEquipmentNeeded,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});

  final Map<Filter, bool> currentFilters;

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isBeginnerFriendly = true;
  var _isNoEquipmentNeeded = true;

  @override
  void initState() {
    super.initState();
    _isBeginnerFriendly = widget.currentFilters[Filter.isBeginnerFriendly]!;
    _isNoEquipmentNeeded = widget.currentFilters[Filter.isNoEquipmentNeeded]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          if (didPop) {
            return;
          }
          Navigator.of(context).pop({
            Filter.isBeginnerFriendly: _isBeginnerFriendly,
            Filter.isNoEquipmentNeeded: _isNoEquipmentNeeded,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _isBeginnerFriendly,
              onChanged: (isCheck) {
                setState(() {
                  _isBeginnerFriendly = isCheck;
                });
              },
              subtitle: Text(
                'Only Beginers friendly exercises',
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
            SwitchListTile(
              value: _isNoEquipmentNeeded,
              onChanged: (isCheck) {
                setState(() {
                  _isNoEquipmentNeeded = isCheck;
                });
              },
              subtitle: Text(
                'Exercise withow equipment',
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 32, right: 22),
            ),
           
          ],
        ),
      ),
    );
  }
}
