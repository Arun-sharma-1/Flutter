import 'package:flutter/material.dart';

class MyInfo extends StatefulWidget {
  static String id ='my_card';
  @override
  State<MyInfo> createState() => _MyInfoState();
}

class _MyInfoState extends State<MyInfo> {


  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/logo.png'),
              ),
              Text('Arun Sharma', style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.black)),
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
      );
  }
}
class rowFile extends StatelessWidget {
  final textString;
  final widgetInfo;

  rowFile(this.textString, this.widgetInfo);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        child: ListTile(
          leading: Icon(
            widgetInfo,
            size: 40,
          ),
          title: Text(textString),
        ),
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),

      ),
    );
  }
}

