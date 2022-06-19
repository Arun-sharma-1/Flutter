import 'package:flutter/material.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal>favoriteMeal;
  const FavoriteScreen({Key? key , required this.favoriteMeal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('You have no favorite items - start adding some!')),
    );
  }
}
