import 'dart:async';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const route = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double targetValue = 24.0;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed('/home-page');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Twitter',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 80, 80, 236),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Color.fromARGB(255, 80, 80, 236),
              ),
              strokeWidth: 11.0,
            ),
          ],
        ),
      ),
    );
  }
}
