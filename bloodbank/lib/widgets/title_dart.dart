import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  final String title;
  const Titles({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
    );
  }
}

class SubTitle extends StatelessWidget {
  final String subtitle;
  const SubTitle({
    Key? key,
    required this.subtitle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      subtitle,
      style: TextStyle(color: Colors.white, letterSpacing: 1),
    );
  }
}

