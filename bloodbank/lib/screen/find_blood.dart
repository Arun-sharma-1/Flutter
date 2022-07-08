import 'package:flutter/material.dart';
import 'donate_blood_screen.dart';
class FindBloodScreen extends StatelessWidget {
  static String routeName='find-blood-screen';
  const FindBloodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Title(title: 'Find Blood'),
        SubTitle(subtitle: 'Find nearby blood banks')

      ],),
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

class Title extends StatelessWidget {
  final  String title;
  const Title({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.white),
    );
  }
}
