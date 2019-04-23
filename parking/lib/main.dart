import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.red[400],
        primaryColor: Colors.red,
        accentColor: Colors.red,

        // Default Texts
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 23.0, fontFamily: 'Hind', color: Colors.white),
        ),
      ),
      home: HomePage()
    );
  }
}
