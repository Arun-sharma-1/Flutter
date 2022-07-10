import 'package:flutter/material.dart';
import '../widgets/title_dart.dart';
import '../widgets/blood_bank_info.dart';
import '../modal/bookings.dart';

class MyBookingScreen extends StatelessWidget {
  static String routeName = 'my-booking-screen';

  List bookings =[];

  @override
  Widget build(BuildContext context) {
    // DateTime date =  ModalRoute.of(context)!.settings.arguments as DateTime;
    final Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      backgroundColor: Color(0xFFF46A6A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Titles(title: 'My Bookings'),
              SizedBox(
                height: 20,
              ),
              GenricInfoCard(
                  title: data['bloodBankName'], trialing: data['date'])
            ],
          ),
        ),
      ),
    );
  }
}
