import 'package:flutter/material.dart';
import 'package:myshop/models/meal.dart';
import '../dummy_data.dart';

class MealDetail extends StatelessWidget {
  final String id;
  MealDetail({required this.id});

  @override
  Widget build(BuildContext context) {
    final firstMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
        appBar: AppBar(
          title: Text(firstMeal.title),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              firstMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Ingrediants',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
          ),
          CustomContainer(
            ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: Text(
                    firstMeal.ingredients[index],
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                );
              },
              itemCount: firstMeal.ingredients.length,
            ),
          ),
          Text(
            'Steps',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
          ),
          CustomContainer(ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 20,
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(firstMeal.steps[index]),
                  ),
                  Divider(),
                ],
              );
            },
            itemCount: firstMeal.steps.length,
          ))
        ])));
  }
}

Widget CustomContainer(Widget child) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      height: 250,
      width: 400,
      child: child);
}
