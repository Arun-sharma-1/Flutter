import 'dart:ffi';

import 'package:assign/widgets/title_dart.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  static String routeName = 'booking-screen';
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String selectedBloodGroup = 'O+';
  List<String> bloodGroups = ['O+', 'O-', 'A+', 'A-', 'B+', 'B-'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Titles(title: 'Book Slot'),
                  SubTitle(subtitle: 'Sarita blook bank'),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Select Blood Group',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  DropdownButton(
                    icon: Container(
                      margin: EdgeInsets.only(left: 5),
                        color: Colors.black,
                        child: Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.white,
                        )),
                    iconSize: 28,
                    items: bloodGroups.map((bloodgroup) {
                      return DropdownMenuItem<String>(
                        child: Text(bloodgroup , style: TextStyle(fontWeight: FontWeight.bold
                        ),),
                        value: bloodgroup,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedBloodGroup = value.toString();
                      });
                    },
                    value: selectedBloodGroup,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
