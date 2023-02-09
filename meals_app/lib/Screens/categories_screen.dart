import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
        GridView(
            padding: EdgeInsets.all(25),

            //We will not use every information of DUMMY CATEGORIES list in this screen,
            // so we need to use map method for creating custom widget
            children: DUMMY_CATEGORIES.map( //returns an iterable, not a list.
              (item) => 
                CategoryItem(
                    item.id,
                    item.title, 
                    item.color,
                    ),
              ).toList(),
            
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              childAspectRatio: 12 / 4,
              crossAxisSpacing: 20,
              mainAxisSpacing: 50,  
            ),
            ),
      ],
    );
  }
}