import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'home.dart';
import 'main.dart';

class MySpalshScreen extends StatefulWidget {
  const MySpalshScreen({Key? key}) : super(key: key);

  @override
  State<MySpalshScreen> createState() => _MySpalshScreenState();
}

class _MySpalshScreenState extends State<MySpalshScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: AnimatedSplashScreen(
        duration: 3000,
        splash: Image.network('https://cdn-icons-png.flaticon.com/512/4349/4349066.png',),
        nextScreen:HomePage(),
         splashIconSize: 200,
        splashTransition: SplashTransition.scaleTransition,
        pageTransitionType: PageTransitionType.rightToLeft,
        curve: Curves.easeInOut,
        animationDuration: Duration(seconds: 3),
        backgroundColor: Colors.black,
       )

      // EasySplashScreen(
      //   logo: Image.network('https://icon-library.com/images/twitter-white-icon/twitter-white-icon-25.jpg',color: Colors.white,),
      //   // title: Text('Welcome'),
      //   backgroundColor: Colors.blue,
      //   loaderColor: Colors.white,
      //   //backgroundImage: AssetImage('assets/q1.jpg'),
      //   logoWidth: 50,
      //   //loadingText: Text('Hello'),
      //   //gradientBackground: LinearGradient(colors: [Colors.green,Colors.red]),
      //   showLoader: false,
      //   navigator: MyApp(),
      // ),



      // Lottie.network('https://assets1.lottiefiles.com/packages/lf20_ihkjwhbc.json',)


    );
  }
}
