import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

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
                      controller: _emailController,
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
                      controller: _passController,
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
                    onPressed: () async {
                      await _auth.createUserWithEmailAndPassword(
                          email: 'arunsharma@1223', password: '1234');
                      // Navigator.of(context)
                      //     .pushReplacement( MaterialPageRoute(builder: (context) {
                      //   return LoginScreen(email: fieldEmail,);
                      // }));
                    },
                    child: Text('Login'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
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
