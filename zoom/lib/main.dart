import 'package:flutter/material.dart';
import './utils/colors.dart';
import './screens/login_screen.dart';
import './screens/home_screen.dart';
import './screens/videoCall_screen.dart';

void main() {
  runApp(const Zoom());
}

class Zoom extends StatelessWidget {
  const Zoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'zoom clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        VideoCall.id: (context) =>  VideoCall(),
      },
      home: HomeScreen(),
    );
  }
}
