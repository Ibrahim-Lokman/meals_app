import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Challenging,
  Hard
}

enum Affordability {
  Affordable,
  Pricey,
  Luxurious
}

class Meal {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;

  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool  isVegetarian;

  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;

  final Complexity complexity;
  final Affordability affordability;

Meal({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,

   required this.isGlutenFree,
   required this.isLactoseFree,
   required this.isVegan,
   required this.isVegetarian,

   required this.categories,
   required this.ingredients,
   required this.steps,

   required this.complexity,
   required this.affordability, 
  });

}