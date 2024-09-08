import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/firebase_services/splashServices/splashService.dart';
import 'package:flutter_application_1/ui/auth/signup/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Splashservice().isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/signUp.png'),
            SizedBox(
              height: 100,
            ),
            Text(
              'FireBase Practice Project',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
