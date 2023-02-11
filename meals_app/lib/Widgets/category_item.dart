import 'package:flutter/material.dart';
import 'package:meals_app/Screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);
 
  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
     CategoryMealsScreen.routeName,
     arguments: {
      'id' : id,
      'title' : title,
     },
    );
  }
//
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.food_bank_rounded,
                    size: 40, 
                    color: Colors.red

                ),
                Text(
                   title,
                   style: Theme.of(context).textTheme.subtitle1,
              ),
              ],
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                    child: Text("Subtitle 1"),
                    
                   decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Colors.green,
                   ),
                    ),
                   Container(
                    padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                    child: Text("Subtitle 2"),
                    
                   decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Color.fromARGB(255, 219, 224, 155),
                      
                   ),
                    ),
                    Container(),
                  Container(
                    padding: EdgeInsets.symmetric(
                          vertical: 2,
                          horizontal: 5,
                        ),
                    child: Text("Subtitle 3"),
                    
                   decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(16.0),
                      color: Color.fromARGB(255, 219, 224, 155),
                      
                   ),
                  ),
                  
                ],
              ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.25),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
    
        ),
      ),
    );
  }
}