import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_app/screens/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

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
    Timer(Duration(seconds: 2), () async {
      // Obtain shared preferences.
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLogin = await prefs.getBool('isLogin') ?? false;

      if (isLogin) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.deepPurpleAccent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.yellow,
                ),
              ),
              Text(
                'Developed by Ally Soft Solutons',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ));
  }
}
