import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/Screens/categories_screen.dart';
import 'package:meals_app/Screens/favorites_screen.dart';
import 'package:meals_app/Widgets/main_drawer.dart';

import '../Models/meal.dart';

class TabScreen extends StatefulWidget {
  
  final List<Meal> favoriteMeals;

  TabScreen(this.favoriteMeals);
  
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {


  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 0;


  @override
  void initState(){
   _pages = [
   {
    'page': CategoriesScreen() as Widget, 
    'title': 'Categories',
    },
   {
    'page': FavoritesScreen(widget.favoriteMeals) as Widget, 
    'title': 'My Favorites',
    },
  ];

  super.initState();

  }

  void _selectPage(int index){
      setState(() {
        _selectedPageIndex = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'] as String),
         ),
          drawer: MainDrawer(),
          body: _pages[_selectedPageIndex]['page'] as Widget,
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