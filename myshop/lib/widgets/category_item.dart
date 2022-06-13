import 'package:flutter/material.dart';
import '../screens/meals_choice.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String id;
  const CategoryItem(
      {Key? key, required this.title, required this.color, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          return MyMeal(
            title: title,
            id: id,
          );
        })
        );


        // Navigator.of(context)
        //     .pushNamed(MyMeal.routeName, arguments: {title: title, id: id});
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius:
          BorderRadius.circular(15), //to match with other border radius
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              color.withOpacity(0.5),
              color,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
      ),
    );
  }
}
