import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import './screens/home_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';

class SplashScreens extends StatelessWidget {
  const SplashScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: AnimatedSplashScreen(
        splash: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.asset(
            //   "assets/manwithlaptop.json",
            //   repeat: false,
            // ),
            const Text(
              "Welcome to the app",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Lottie.asset("assets/dogy.json", height: 200)
          ],
        ),
        nextScreen: HomePage(),
        backgroundColor: Colors.greenAccent,
        splashIconSize: double.infinity,
        duration: 1500,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        animationDuration: const Duration(seconds: 3),
      ),
    );
  }
}

/* 

  SplashScreen(
      seconds: 3,
      backgroundColor: Color.fromRGBO(255, 254, 1, 0.4),
      photoSize: 60,
      navigateAfterSeconds: const HomePage(),
      image: Image.asset("assets/icon.png"),
      loaderColor: Colors.black,
      loadingText: Text('From arun sharma',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 20)),
      title: Text(
        'Creative Icon',
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
      ),
    );
 */