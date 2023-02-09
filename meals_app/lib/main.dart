import 'package:flutter/material.dart';
import 'package:meals_app/Models/meal.dart';
import 'package:meals_app/Screens/categories_screen.dart';
import 'package:meals_app/Screens/category_meals_screen.dart';
import 'package:meals_app/Screens/filters_screen.dart';
import 'package:meals_app/Screens/meal_details_screen.dart';
import 'package:meals_app/Screens/tabs_screen.dart';
import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  //Things to control in filter option

  Map<String, bool> _filters = {
    'gluten' : false,
    'lactose' : false,
    'vegetarian' : false,
  };

  //Imported fron dummy_dart.dart file
  List<Meal> _availableMeals = DUMMY_MEALS;

  // This list will be filled up when we will select any meal as favorite 
  List<Meal> _favoriteMeals = [];
  


  void _setFilters(Map<String, bool> filterData){
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal){
        if( _filters['gluten']! && !meal.isGlutenFree){
          return false;
        }
         if(_filters['lactose']! && !meal.isLactoseFree){
          return false;
        }
         if(_filters['vegetarian']! && !meal.isVegetarian){
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId){
    final existingIndex = 
      _favoriteMeals.indexWhere(
        (meal) => meal.id == mealId
      );

      if(existingIndex >= 0) {
        setState((){
          _favoriteMeals.removeAt(existingIndex);
        });
      } else {
        setState((){
          _favoriteMeals.add(
            DUMMY_MEALS.firstWhere(
              (meal) => meal.id == mealId
            ),
          );
        });
      }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any(
      (meal) => meal.id == id
    );
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.blue,
        canvasColor: Color.fromRGBO(255, 255, 255, 1),
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
          ),
        ),
      ),
     // home: CategoriesScreen(),
      initialRoute: '/',
      routes: {

        //initially there is no favorite meals
        '/' :(context) => TabScreen(_favoriteMeals),
        
        CategoryMealsScreen.routeName : (context) => CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName : (context) => MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters, _setFilters),

      },

      /*
      onGenerateRoute: (settings) {
        print(settings.arguments);

        /*

        if(settings.name == '/meal-details') {
          return  .......;
        } else if(settings.name == '/something-else') {
          return  ...;
        }
        
        */

        return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
          return MaterialPageRoute(
          builder: (context) => CategoriesScreen(),);
      },

      */
    );
  }
}
