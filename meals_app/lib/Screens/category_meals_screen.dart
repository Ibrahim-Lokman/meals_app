import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/Widgets/meal_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
 
 /*
  final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(this.categoryId, this.categoryTitle);
*/
  @override
  Widget build(BuildContext context) {

    final routesArgs = ModalRoute.of(context)!.settings.arguments as Map<String,String>;
    final  String? categoryId = routesArgs['id'];
    final  String categoryTitle = routesArgs['title']!;
    final categoryMeals = DUMMY_MEALS.where(
      (meal){
        return meal.categories.contains(categoryId);
      }
    ).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle
          ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title : categoryMeals[index].title, 
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,

            );
        }, itemCount: categoryMeals.length,),
    );
  }
}