import 'package:flutter/material.dart';
import 'package:make_it_rain/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "MAke It Rain",
      home: Home(),
    );
  }
}
