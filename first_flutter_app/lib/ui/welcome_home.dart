import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blue,
      child: Center(
        child: Text(
          'Hello, Material!',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 47.0,
            fontWeight: FontWeight.w900
          ),
        ),
      ),
    );
  }
}
