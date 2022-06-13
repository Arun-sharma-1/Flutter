import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class MyMeal extends StatelessWidget {
  static String routeName = 'my-meal';

  final String id;
  final String title;
  const MyMeal({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final routeArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // ! is bang operator , this assure that args can not be null
    // final categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs['id'];

    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
              id: categoryMeal[index].id,
              title: categoryMeal[index].title,
              imagUrl: categoryMeal[index].imageUrl,
              duration: categoryMeal[index].duration,
              complexity: categoryMeal[index].complexity,
              affordability: categoryMeal[index].affordability);
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
