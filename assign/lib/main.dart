import 'package:flutter/material.dart';

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
      home: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 150),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sarita Blood Bank',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.green,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                width: 150,
                // height: 100,
                color: Colors.blueAccent,
                child: Column(
                  children: [
                    Text(
                      'Blood Group',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                      ),
                    ),
                    Text('B +ve'),
                    Text('Add unit'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
