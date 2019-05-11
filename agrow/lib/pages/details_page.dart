import 'package:flutter/material.dart';
import 'package:agrow/styles.dart';


class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double _coverHeight = 190.0;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(

        children: <Widget>[

          Container(
            height: _coverHeight,
            width: double.infinity,
            child: Image.asset('assets/peach.jpg',fit: BoxFit.fitWidth,),

          ),
          Container(
          height: _coverHeight,
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
                end: FractionalOffset.topCenter,
                begin: FractionalOffset.bottomCenter,
                colors: [
                  Colors.black87,
                  Colors.black54,
                ],
              ),
            ),
          ),
          Container(
            height: _coverHeight,
            child: Row(
              
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 15.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        width: 130.0,
                        height: 45.0,
                        child: RaisedButton(
                          color: Colors.green,
                            onPressed: (){},
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.shopping_cart, color: Colors.white, size: 13.0,),
                                Container(width: 7.0,),
                                Text('ყიდვა', style: buttonTextStyle,),
                              ],
                            )
                        ),
                      ),
                      Container(height: 25.0,),
                      SizedBox(
                        width: 130.0,
                        height: 45.0,
                        child: RaisedButton(
                          color: Colors.green,
                          onPressed: (){},
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.add, color: Colors.white, size: 14.5,),
                              Container(width: 7.0,),
                              Text('დამატება', style: buttonTextStyle,),
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
