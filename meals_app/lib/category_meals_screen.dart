import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryMealsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "The Recipes"
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