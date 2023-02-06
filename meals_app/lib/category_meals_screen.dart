import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryTitle
          ),
      ),
      body: Center(
        child: Text(
          'Recipes List !!!'
        ),
      ),
    );
  }
}