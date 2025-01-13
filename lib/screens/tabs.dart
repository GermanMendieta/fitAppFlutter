import 'package:fitapp/data/dummy_data.dart';
import 'package:fitapp/models/category.dart';
import 'package:fitapp/models/exercise.dart';
import 'package:fitapp/screens/categories.dart';
import 'package:fitapp/screens/exercises.dart';
import 'package:fitapp/screens/filters.dart';
import 'package:fitapp/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

const kInitialFilter = {
  Filter.isBeginnerFriendly: true,
  Filter.isNoEquipmentNeeded: true,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  String activePageTitle = 'Categories';
  List<Exercise> favoritesList = [];
  List<Exercise> availableExercise = dummyExercises;
  List<Category> availableCategoreis = dummyCategories;
  Map<Filter, bool> _selectedFilters = kInitialFilter;

  void _setFavoriteController(Exercise element) {
    bool isFavorite = favoritesList.contains(element);
    if (isFavorite) {
      setState(() {
        favoritesList.remove(element);
      });
    } else {
      setState(() {
        favoritesList.add(element);
      });
    }
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void applyFilters(Map<Filter, bool> selectedFilters) {
    List<Exercise> tmpList = dummyExercises.where(
      (element) {
        bool condition = (element.isBeginnerFriendly ==
                    selectedFilters[Filter.isBeginnerFriendly] ||
                selectedFilters[Filter.isBeginnerFriendly] == false) &&
            (element.isNoEquipmentNeeded ==
                    selectedFilters[Filter.isNoEquipmentNeeded] ||
                selectedFilters[Filter.isNoEquipmentNeeded] == false);
        return condition;
      },
    ).toList();
    print(tmpList);

    setState(() {
      availableExercise = tmpList;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      final result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (context) => FiltersScreen(currentFilters: _selectedFilters),
        ),
      );
      setState(() {
        _selectedFilters = result ?? kInitialFilter;
      });
      applyFilters(_selectedFilters);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage;
    if (_selectedPageIndex > 0) {
      activePageTitle = 'Your Favorites';
      activePage = ExercisesScreen(
        exercises: favoritesList,
        setFavoriteController: _setFavoriteController,
        favoritesList: favoritesList,
      );
    } else {
      activePageTitle = 'Categories';
      activePage = CategoriesScreen(
        categories: availableCategoreis,
        setFavoriteController: _setFavoriteController,
        favoritesList: favoritesList,
        availableExercise: availableExercise,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(onSelectedScreen: _setScreen),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: activePage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list_sharp),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          )
        ],
        onTap: (index) {
          _selectedPage(index);
        },
        currentIndex: _selectedPageIndex,
      ),
    );
  }
}
