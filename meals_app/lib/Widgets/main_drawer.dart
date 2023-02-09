import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/Screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, Function()? tapHandler) {
    return ListTile(
            leading: Icon(
              icon,
              size: 26,
              color: Color.fromARGB(255, 255, 0, 0),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'RobotoCOndensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap:  tapHandler,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 25,
              left: 15,
            ),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Cooking Up', 
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Colors.white,
              ),),
          ),
          SizedBox(height: 20),
          buildListTile(
            'Meals', 
            Icons.restaurant,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          buildListTile(
            'Filters', 
            Icons.settings,
            () {
               Navigator.of(context).pushNamed(FiltersScreen.routeName);
            },
          ),
          
        ],
      ),
    );
  } 
}