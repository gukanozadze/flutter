import 'package:flutter/material.dart';
import 'package:agrow/styles.dart';
import 'package:agrow/custom_shape_clipper.dart';

class HomeScreenTopPart extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: 400.0,

            decoration: BoxDecoration(

              gradient: LinearGradient(colors: [
                firstColor,
                secondColor
              ]),

            ),
            child: Column(
              children: <Widget>[
                SizedBox(height: 35.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.white),
                      SizedBox(width: 10.0,),
                      Text('Tbilisi', style: TextStyle(color: Colors.white),),
                      Spacer(),
                      Icon(Icons.settings, color: Colors.white)
                    ],
                  ),
                ),
                Container(
                  width: 200.0,
                  height: 200.0,
                  child: Image.asset('assets/logo-final.png',),
                ),
                SizedBox(height: 15.0,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(

                      controller: TextEditingController(),
                      cursorColor: appTheme.primaryColor,

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Plant',
                        contentPadding: EdgeInsets.all(16.0),
                        suffixIcon: Icon(Icons.search, color: Colors.green,),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}