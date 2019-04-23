import 'package:flutter/material.dart';

import './booking.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}
  

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking'),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsetsDirectional.only(end: 30.0),
            icon: Icon(Icons.directions_car),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BookingPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('თავისუფალი ადგილები'),
            Container(
              padding: EdgeInsets.all(10.0),
            ),
            Text(
              '15',
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}