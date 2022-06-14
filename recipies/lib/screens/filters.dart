import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  static String routeName = 'filtersScreen';
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('This is filter')),
    );
  }
}
