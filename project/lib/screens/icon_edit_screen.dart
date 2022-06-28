import 'package:flutter/material.dart';
import 'expences_screen.dart';
import 'income_screen.dart';

class IconEditScreen extends StatelessWidget {
  static String routeName = 'edit-icon-screen';
  final String productId;
  const IconEditScreen({Key? key, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: Duration(seconds: 1),
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          elevation: 0,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          bottom: const TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 30),
              indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 5.0),
                  insets: EdgeInsets.symmetric(horizontal: 50.0)),
              labelColor: Colors.black,
              indicatorColor: Colors.deepPurple,
              // indicatorSize: TabBarIndicatorSize(2) ,
              tabs: [
                Tab(
                  text: 'Expences',
                ),
                Tab(
                  text: 'Income',
                ),
              ]),
        ),
        body: TabBarView(
            children: [ExpencesScreen(productId: productId), IncomeScreen()]),
      ),
    );
  }
}
