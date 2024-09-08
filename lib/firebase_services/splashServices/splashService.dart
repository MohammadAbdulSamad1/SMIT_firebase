import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/auth/login/login.dart';
import 'package:flutter_application_1/ui/home.dart';

class Splashservice {
  void isLogin(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      FirebaseAuth auth = FirebaseAuth.instance;
      final user = auth.currentUser;
      if (user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => Home()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      }
    });
  }
}
