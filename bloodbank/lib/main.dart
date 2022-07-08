import 'package:assign/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'screen/login_screen.dart';
import 'screen/donate_blood_screen.dart';
import './screen/find_blood.dart';
import './screen/booking_screen.dart';
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
        DonateBloodScreen.routeName:(context) =>DonateBloodScreen(),
        FindBloodScreen.routeName:(context)=>FindBloodScreen(),
        BookingScreen.routeName:(context)=>BookingScreen()
      },
    );
  }
}
