import 'package:flutter/material.dart';
import 'package:recipies/dummy_data.dart';
import './widgets/navigation.dart';
import './screens/category_screen.dart';
import './screens/item_screen.dart';
import './screens/filters.dart';
import './models/meal.dart';
import './widgets/drawer.dart';
import './screens/meal_details.dart';

void main() {
  runApp(MyRecipies());
}

class MyRecipies extends StatefulWidget {
  @override
  State<MyRecipies> createState() => _MyRecipiesState();
}

class _MyRecipiesState extends State<MyRecipies> {
  List<Meal> _favoriteMeals = [];
  void _toogleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == mealId));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.green,
          canvasColor: const Color.fromRGBO(255, 254, 229, 1)),

      home: Scaffold(
        drawer: CustomDrawer(),
        body: BottomNavigation(favoriteMeals: _favoriteMeals),
      ),
      // initialRoute: CategoriesScreen.routeName,
      routes: {
        BottomNavigation.routeName: (context) =>
            BottomNavigation(favoriteMeals: _favoriteMeals),
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        ItemScreen.routeName: (context) => const CategoriesScreen(),
        FiltersScreen.routeName: (context) => const FiltersScreen(),

      },
    );
  }
}
