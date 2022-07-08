import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var fieldEmail;
  var fieldPass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 114, 118, 80),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            child: Column(
              children: [
                Text(
                  'Life Drop ',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1),
                ),
                Text(
                  'your blood can save lives',
                  style: TextStyle(color: Colors.white, letterSpacing: 1),
                ),
                SizedBox(
                  height: 150,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextField(
                      onChanged: (newValue) {
                        fieldEmail = newValue;
                        // print(fieldEmail);
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter your Email',
                          fillColor: Colors.white),
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Passwords',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextField(
                      obscureText: true,
                      onChanged: (newText) {
                        fieldPass = newText;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration:
                          InputDecoration(hintText: 'Enter your Password'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return LoginScreen(email: fieldEmail,);
                      }));
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(primary: Colors.red , ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
