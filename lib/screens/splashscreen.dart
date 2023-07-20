import 'package:flutter/material.dart';
import 'package:news_app/screens/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    // Simulate a delay for the splash screen to stay visible for some time
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isVisible = false;
        Future.delayed(Duration(seconds: 1), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Home()),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0,
          duration: Duration(seconds: 1),
          child: Text(
            'News App',
            style: TextStyle(
                fontFamily: 'Black', color: Colors.white, fontSize: 30),
          ),
        ),
      ),
    );
  }
}
