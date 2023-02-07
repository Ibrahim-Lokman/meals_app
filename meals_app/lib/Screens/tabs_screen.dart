import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/Screens/categories_screen.dart';
import 'package:meals_app/Screens/favorites_screen.dart';

class TabScreen extends StatefulWidget {

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(
                  Icons.category,
                  ),
                text: 'Categories',
                ),
              Tab(
                icon: Icon(
                  Icons.star,
                  ),
                text: 'Favorites',
                ),
            ],
          ),
         ),
          body: TabBarView(children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen() 
          ],
        ),
      ),
    );
  }
}