import 'package:assign/home_screen.dart';
import 'package:flutter/material.dart';
import './login_screen.dart';
import 'blood_bank_list.dart';

// import 'login_screen.dart';
//
void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeScreen.routeName,
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
        BloodBankList.routeName:(context) =>BloodBankList(),
      },
    );
  }
}
