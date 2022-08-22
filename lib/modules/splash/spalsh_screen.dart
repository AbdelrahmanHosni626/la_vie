import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../login/login_screen.dart';



class SplashScreen extends StatefulWidget {

  final Widget widget;

  const SplashScreen({Key? key, required this.widget}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Center(
          child: Stack(
            children: const [
              Text(
                'LaVie',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 50.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'meddon',
                ),
              ),
              Positioned(
                top: 20.0,
                left: 65.0,
                width: 40.0,
                height: 40.0,
                child: Image(
                  image: AssetImage(
                    'assets/images/bets.jpg',
                  ),
                ),
              ),
            ],
          ),
        ),
        nextScreen: widget.widget,
        splashIconSize: 500,
        animationDuration: const Duration(milliseconds: 1500),
        duration: 3500,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        backgroundColor: Colors.white,
      ),
    );
  }
}
