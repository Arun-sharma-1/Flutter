import 'package:assign/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'modal/blood_bank_list.dart';
import 'screen/login_screen.dart';
import 'screen/donate_blood_screen.dart';
import './screen/find_blood.dart';
import './screen/booking_screen.dart';
import 'package:provider/provider.dart';
import './screen/my_booking_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import './modal/bookings.dart';

Future<void> main() async {
  //for intilization of firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BankList()),
        ChangeNotifierProvider(create: (_) => AllBookings()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          DonateBloodScreen.routeName: (context) => DonateBloodScreen(),
          FindBloodScreen.routeName: (context) => FindBloodScreen(),
          BookingScreen.routeName: (context) => BookingScreen(),
          MyBookingScreen.routeName: (context) => MyBookingScreen(),
        },
      ),
    );
  }
}
