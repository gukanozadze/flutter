import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'Gesture'; 
 


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Gesture Controll',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.deepOrange[500],
        ),
        body: Center(
          child: CustomButton()
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      
      onTap: () {
        final Widget snackBat = SnackBar(content: Text("Hello Gestures"),);
        Scaffold.of(context).showSnackBar(snackBat);
      },
      
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(10.0)
        ),
        
        child: Text("First Button"),
      ),
    );
  }
}