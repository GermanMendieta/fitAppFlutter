import 'package:fitapp/data/dummy_data.dart';
import 'package:fitapp/screens/categories.dart';
import 'package:fitapp/screens/exersices.dart';
import 'package:flutter/material.dart';

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

  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage;
    if (_selectedPageIndex > 0) {
      activePage = const ExersicesScreen(
        exercises: dummyExercises,
      );
      activePageTitle = 'Your Favorites';
    } else {
      activePage = CategoriesScreen(
        categories: dummyCategories,
      );
      activePageTitle = 'Categories';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
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
