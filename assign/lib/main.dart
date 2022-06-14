// import 'package:assign/home_screen.dart';
import 'package:flutter/material.dart';

// import 'login_screen.dart';
//
void main() {
  runApp(MyApp());
}

//
// class MyApp extends StatefulWidget {
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: HomeScreen.routeName,
//       routes: {
//         LoginScreen.routeName: (context) => LoginScreen(),
//         HomeScreen.routeName: (context) => HomeScreen(),
//       },
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: 400,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: 100,
                      color: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: 100,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
