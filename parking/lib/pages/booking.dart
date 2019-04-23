import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BookingPage extends StatelessWidget {
  sendData(){
    final Map<String, dynamic> firebaseData = {
      'name': 'soso',
      'username': 'nozadze',
      'pressed': true,
    };
    http.post('https://flutterpractice-71413.firebaseio.com/products.json', 
        body: json.encode(firebaseData)).then((http.Response response){
          print(json.decode(response.body));
        });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              color: Colors.red,
              onPressed: () {
                sendData();
                Navigator.pop(context);
              },
              child: Text('დაჯავშნა', style: TextStyle(color: Colors.white, fontSize: 18.0),),
            ),

          ],
        ),
      ),
    );
  }
}
