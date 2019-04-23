import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String title;
  final String image;

  ProductPage(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(image),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(title),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text('Delete', style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
