import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      child: Text("Hello Container", textDirection: TextDirection.ltr,),

    );
  }
}