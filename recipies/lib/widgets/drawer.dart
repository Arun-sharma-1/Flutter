import 'package:flutter/material.dart';
import './navigation.dart';
import '../screens/filters.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.orangeAccent,
            width: double.infinity,
            height: 250,
            child: const Center(
                child: Text(
              'Cooking Up! ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            )),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, BottomNavigation.routeName);
            },
            leading: const  Icon(
              Icons.category,
              size: 30,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
            },
            leading: const Icon(
              Icons.settings,
              size: 30,
            ),
            title: const Text(
              'filters',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
            ),
          ),
        ],
      ),
    );
  }
}
