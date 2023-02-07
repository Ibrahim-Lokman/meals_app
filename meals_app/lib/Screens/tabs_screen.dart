import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/Screens/categories_screen.dart';
import 'package:meals_app/Screens/favorites_screen.dart';
import 'package:meals_app/Widgets/main_drawer.dart';

class TabScreen extends StatefulWidget {

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Map<String, dynamic>> _pages = [
    //as Widget
   {'page': CategoriesScreen() as Widget, 'title': 'Categories',},
   {'page': FavoritesScreen() as Widget, 'title': 'My Favorites',},
  ];

  int _selectedPageIndex = 0;

  void _selectPage(int index){
      setState(() {
        _selectedPageIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title']),
         ),
          drawer: MainDrawer(),
          body: _pages[_selectedPageIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
            onTap : _selectPage,
            backgroundColor:Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Color.fromARGB(255, 138, 255, 142),
            currentIndex: _selectedPageIndex,
          //  type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.category),
                label: 'Categories',
                ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favorites',
                ),
            ],
          ),
    );
  }
}