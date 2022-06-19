import 'package:flutter/material.dart';
import '../models/meal.dart'; // for enums
import '../screens/meal_detail.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imagUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem(
      {required this.id,
      required this.title,
      required this.imagUrl,
      required this.duration,
      required this.complexity,
      required this.affordability});

  String checkComplexity() {
    if (complexity == Complexity.Simple)
      return "Simple";
    else if (complexity == Complexity.Challenging)
      return "Challenging";
    else
      return "Hard";
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MealDetail(
        id: id,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 3,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imagUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 10,
                  child: Container(
                    color: Colors.black38,
                    width: 300,
                    padding:const  EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: Row(children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 8,
                      ),
                      Text('$duration min'),
                    ]),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Icons.work),
                        SizedBox(
                          width: 8,
                        ),
                        Text(checkComplexity()),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
