import 'package:my_card/textStyle.dart';

import 'package:flutter/material.dart';
import 'package:my_card/rowFile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/arun.png'),
              ),
              TextStyles('Arun Sharma'),
              Text(
                'Flutter Developer',
                style: TextStyle(letterSpacing: 3.0, color: Colors.black),
              ),
              SizedBox(
                height: 10,
                width: 200,
                child: Divider(
                  color: Colors.black,
                ),
              ),
              rowFile('+91 9116016932', Icons.phone),
              rowFile('arunmadhopur750@gmail.com', Icons.email),
            ],
          ),
        ),
        // backgroundColor: Colors.teal,
      ),
    ));
  }
}
