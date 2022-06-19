import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = 'FiltersScreen';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(title: Text('Your Filters')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Text(
              'Adjust your Meal Selection',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _glutenFree,
                  title: Text('Gluten Free'),
                  subtitle: Text('Only include Gluten Free'),
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _lactoseFree,
                  title: Text('Lactose Free'),
                  subtitle: Text('Only include Lactose Free'),
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _vegan,
                  title: Text('vegan '),
                  subtitle: Text('Only include Vegan meals'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegan= newValue;
                    });
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  value: _vegetarian,
                  title: Text('Lactose Free'),
                  subtitle: Text('Only include Vegetarian Free'),
                  onChanged: (newValue) {
                    setState(() {
                      _vegetarian= newValue;
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
