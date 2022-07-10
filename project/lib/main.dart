import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './splash_screen.dart';
import 'package:provider/provider.dart';
import './provider/itemList_provider.dart';
import './screens/product_detail_screen.dart';
import './screens/edit_screen.dart';
import 'package:flutter/services.dart';

Future<void> main()  async {
  //control orientation
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const Pocketify());
}

class Pocketify extends StatelessWidget {
  const Pocketify({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => Items(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.deepPurple,
            canvasColor: Colors.white.withOpacity(0.9)),
        home: const SplashScreens(),
        routes: {
          EditScreen.routeName: (context) => const EditScreen(),
        },
      ),
    );
  }
}
