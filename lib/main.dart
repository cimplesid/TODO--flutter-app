import 'dart:async';
import 'package:flutter/material.dart';
import 'ui/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo app',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        
        primarySwatch: Colors.yellow,
      ),
      home: Home(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => Home()));
    //  Navigator.of(context).pushReplacementNamed('_');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.yellowAccent,
      body: new Center(
        child: Icon(
          Icons.assignment_turned_in,
          size: 200.0,
          color: Colors.white,
        ),
      ),
    );
  }
}

