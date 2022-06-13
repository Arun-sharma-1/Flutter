import 'package:flutter/material.dart';
import 'package:myshop/screens/categories_screen.dart';
import './screens/meals_choice.dart';
import './screens/top_tabScreen.dart';
import './screens/bottom_tabScreen.dart';
import './widgets/filters.dart';

void main() {
  runApp(MyMeals());
}

class MyMeals extends StatelessWidget {
  const MyMeals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
      ),
      initialRoute: BottomTabs.routeName,
      routes: {
        CategoriesScreen.routeName: (context) => const CategoriesScreen(),
        MyMeal.routeName: (context) => const MyMeals(),
        // TopTab.routeName: (context) => const TopTab(),
        BottomTabs.routeName: (context) => BottomTabs(),
        Filters.routeName:(context)=>Filters(),

      },

      //if route is not registered then i will move to this route
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (_) => CategoriesScreen());
      },
    );
  }
}
