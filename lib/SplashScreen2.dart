import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'Feed/feeddefault.dart';
import 'Login/Mainpage.dart';



class SpalshScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedSplashScreen(
          duration: 3000,
          splash: Column(
            children: [
              Image.asset('assets/alien.png',height: 90,width: 90,),
              SizedBox(height: 10,),
              Image.asset('assets/Frame.png',height: 90,width: 90,),

            ],
          ),
          nextScreen: Mainpage(),
          // splashTransition: SplashTransition.fadeTransition,
          //  pageTransitionType: PageTransitionType.scale,
          backgroundColor: Color(0xFFFF6B81),
        )
    );
  }
}