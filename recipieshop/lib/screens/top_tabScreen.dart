import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favorite.dart';
import '../widgets/main_drawer.dart';

class TopTab extends StatelessWidget {
  static String routeName = ' tabs-screen';
  const TopTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar: AppBar(
          title: Text('Recepies'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),FavoriteScreen()
          ],
        ),
      ),
    );
  }
}
