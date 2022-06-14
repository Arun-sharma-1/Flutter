import 'package:flutter/material.dart';
import './widgets/navigation.dart';
import './screens/category_screen.dart';
import './screens/item_screen.dart';
import './screens/filters.dart';
import './widgets/drawer.dart';

void main() {
  runApp(MyRecipies());
}

class MyRecipies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1)),
      home: Scaffold(
        drawer: CustomDrawer(),
        body: const BottomNavigation(),
      ),
      // initialRoute: CategoriesScreen.routeName,
      routes: {
        BottomNavigation.routeName: (context) => const BottomNavigation(),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        ItemScreen.routeName: (context) => const CategoriesScreen(),
        FiltersScreen.routeName: (context) => const FiltersScreen(),
      },
    );
  }
}
