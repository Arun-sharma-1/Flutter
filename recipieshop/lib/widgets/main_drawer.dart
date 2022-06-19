import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../widgets/filters.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            color: Colors.orangeAccent,
            alignment: Alignment.centerLeft,
            child: Text(
              'Cokking UP!',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          BuildListTile('Meals', Icons.restaurant, () {
            Navigator.pushNamed(context, CategoriesScreen.routeName);
          }),
          BuildListTile('Filters', Icons.settings, () {
            Navigator.pushNamed(context, Filters.routeName);
          }),
        ],
      ),
    );
  }

  ListTile BuildListTile(String title, IconData icon, VoidCallback tapHandler) {
    return ListTile(
      onTap: tapHandler,
      leading: Icon(
        icon,
        size: 25,
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }
}
