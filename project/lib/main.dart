import 'package:flutter/material.dart';
import './splash_screen.dart';
import 'package:provider/provider.dart';
import './provider/itemList_provider.dart';

void main() {
  runApp(const Pocketify());
}

class Pocketify extends StatelessWidget {
  const Pocketify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Items(),
      child: MaterialApp(
        theme: ThemeData(
            // primaryColor: Colors.deepPurple,
            // accentColor: Colors.lightGreenAccent,
            // canvasColor: Colors.amber
            ),
        home: SplashScreens(),
      ),
    );
  }
}
