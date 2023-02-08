import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/Widgets/meal_item.dart';
import 'package:meals_app/dummy_data.dart';

import '../Models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  
  String categoryTitle = '';
  List<Meal> displayedMeals = [];
  var _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!_loadedInitData){
    final routesArgs = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final  String? categoryId = routesArgs['id'];
    final  String categoryTitle = routesArgs['title']!;
    displayedMeals = DUMMY_MEALS.where(
      (meal){
        return meal.categories.contains(categoryId);
      }
    ).toList();
    
    _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId){
    setState((){
      displayedMeals.removeWhere(
        (meal) => meal.id == mealId,
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle
          ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title : displayedMeals[index].title, 
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
            removeItem: _removeMeal,

            );
        }, itemCount: displayedMeals.length,),
    );
  }
}