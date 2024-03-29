import 'package:flutter/material.dart';
import 'package:meal/models/recipe.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/favorites_screen.dart';

import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Recipe> favRecipes;
  const TabsScreen(this.favRecipes, {Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<String> _titles = ['Categories', 'Favorites'];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      CategoriesScreen(),
      FavoritesScreen(widget.favRecipes),
    ];

    print('favorites: ${widget.favRecipes.length}');

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text(_titles[_selectedScreenIndex])),
        drawer: MainDrawer(),
        body: _screens[_selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          currentIndex: _selectedScreenIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Categories'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ],
        ),
      ),
    );
  }
}



// tab na appbar:
// bottom: const TabBar(
          //   tabs: [
          //     Tab(
          //       icon: Icon(Icons.category),
          //       text: 'Categories',
          //     ),
          //     Tab(
          //       icon: Icon(Icons.star),
          //       text: 'Favorites',
          //     ),
          //   ],
          // ),