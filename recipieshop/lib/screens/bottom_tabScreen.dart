import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite.dart';
import '../widgets/main_drawer.dart';


class BottomTabs extends StatefulWidget {
  static String routeName = ' bottomtabs-screen';

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _page = 0;
  final List<Map<String, Object>> Pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoriteScreen(), 'title': 'Your Favorite Screen'},
  ];

  void SelectPage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(Pages[_page]['title'].toString()),
      ),
      body: Pages[_page]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.pinkAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        onTap: SelectPage,
        currentIndex: _page,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.category),
              label: 'Categories'),
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.stars),
              label: 'Favorites'),
        ],
      ),
    );
  }
}
