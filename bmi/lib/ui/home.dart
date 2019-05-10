import 'package:bmi/widgets/inputTextFields.dart';
import 'package:flutter/material.dart';



class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('BMI'), backgroundColor: Colors.red,),
      backgroundColor: Colors.red[400],

      body: Container(
        child: ListView(

          children:<Widget>[
            Container(
              //alignment: Alignment.topCenter,
              margin: EdgeInsets.all(12.0),
              padding: EdgeInsets.all(12.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10.0)),
              child: InputTextFields(),
            ),
          ]
        ),
      ),
    );
  }
}
