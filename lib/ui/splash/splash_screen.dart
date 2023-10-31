import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/ui/auth/login/login_screen.dart';
import 'package:flutter_ecommerce_app/ui/home/home_screen.dart';

class SplashScreen extends StatelessWidget{
  static const String routeName = 'SplashScreen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/images/splash_screen.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
