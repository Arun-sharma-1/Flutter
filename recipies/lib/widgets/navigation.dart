import 'package:flutter/material.dart';
import '../screens/category_screen.dart';
import '../screens/favorite.dart';
import './drawer.dart';
import '../models/meal.dart';

class BottomNavigation extends StatefulWidget {
  static String routeName = 'bottomNavigatoin';
  final List<Meal> favoriteMeals;
  const BottomNavigation({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _page = 0;

  void pageHandler(int page) {
    setState(() {
      _page = page;
    });
  }

  List<Object> Pages;
  @override
  void initState() {
    // TODO: implement initState
    Pages = [
      CategoriesScreen(),
      FavoriteScreen(favoriteMeal: widget.favoriteMeals)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Meal'),
      ),
      drawer: CustomDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: pageHandler,
        currentIndex: _page,
        unselectedItemColor: Colors.black38,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
      ),
      body: Pages[_page] as Widget,
    );
  }
}
