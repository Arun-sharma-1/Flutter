import 'package:flutter/material.dart';
import '../components/rounded_button.dart';
import '../components/rounded_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'Hero',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedTextField(
              hintText: 'Enter your email',
                onChanged: (value) {},
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedTextField(hintText: 'Enter your Password',
              onChanged: (value) {},
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Register',
              color: Colors.blueAccent,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}