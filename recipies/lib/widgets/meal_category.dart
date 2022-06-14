import 'package:flutter/material.dart';
import '../screens/item_screen.dart';
import '../dummy_data.dart';
import '../models/meal.dart';

class MealCategory extends StatefulWidget {
  final String id;
  final String title;
  // List<Meal> displayedMeals;
  const MealCategory({required this.id, required this.title});

  @override
  State<MealCategory> createState() => _MealCategoryState();
}

class _MealCategoryState extends State<MealCategory> {
  List<Meal>? displayedMeals;
  @override
  void initState() {
    // TODO: implement initState
    displayedMeals = DUMMY_MEALS
        .where((element) => element.categories.contains(widget.id))
        .toList();
    super.initState();
  }

  void _removeItem(String mealId) {
    setState(() {
      displayedMeals!.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ItemScreen(
            id: displayedMeals![index].id,
            title: displayedMeals![index].title,
            imagUrl: displayedMeals![index].imageUrl,
            duration: displayedMeals![index].duration,
            ingrediants: displayedMeals![index].ingredients,
            Steps: displayedMeals![index].steps,
            removeItem: _removeItem,
          );
        },
        itemCount: displayedMeals?.length,
      ),
    );
  }
}
