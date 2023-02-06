import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';
import 'package:meals_app/category_meals_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.blue,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1 : TextStyle(
            color : Color.fromRGBO(20, 51, 51, 1)
          ),
          bodyText2 : TextStyle(
            color : Color.fromRGBO(20, 51, 51, 1)
          ),
          subtitle1 : TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondensed',

          )),
      ),
     // home: CategoriesScreen(),
    // initialRoute: '/',
      routes: {
        '/' :(context) => CategoriesScreen(),
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(),
      },
    );
  }
}
