import 'dart:async';
import 'package:alhadaf/TermsAndCondition/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    goToNextScreen();
  }

  goToNextScreen()async{
    Timer(Duration(seconds: 5), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      bool isAccepted = (prefs.getBool('isAccepted') ?? false);
      if(!isAccepted){
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => TermsAndCond()));
      }else{
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/header.jpg'),
            fit: BoxFit.fill
          )
        ),
      )
    );
  }
}
