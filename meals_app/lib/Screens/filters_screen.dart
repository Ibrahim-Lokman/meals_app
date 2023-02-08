import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegeterian = false;
  bool _lactoseFree = false;

Widget _buildSwitchListTile(String title, String description, bool currentValue,  Function(bool)? updateValue){
  return SwitchListTile(
                  title: Text(
                    title
                  ),
                  value: currentValue,
                  subtitle: Text(
                    description,
                  ),
                  onChanged: updateValue,
                );
}
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children : <Widget> [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.subtitle1, 
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten Free',
                  'Only include gluten free meals.',
                  _glutenFree,
                  (newValue) {
                    setState(
                      () {
                       _glutenFree = newValue;
                     },
                   );
                  },
                ),
                _buildSwitchListTile(
                  'Lactose Free',
                  'Only include lactose free meals.',
                  _lactoseFree,
                  (newValue) {
                    setState(
                      () {
                       _lactoseFree = newValue;
                     },
                   );
                  },
                ),
                _buildSwitchListTile(
                  'Vegeterian',
                  'Only include vegeterian meals.',
                  _vegeterian,
                  (newValue) {
                    setState(
                      () {
                       _vegeterian = newValue;
                     },
                   );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}