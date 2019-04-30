import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  int _moneyCounter = 60;
  Color _moneyColor = Colors.red;

  void _rainMoney(){
    // Important  - setState is called each time we need to update UI

    setState(() {
      _moneyCounter += 100;    
    });
    if (_moneyCounter > 600){
      _moneyColor = Colors.blue;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Make It Rain"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            // Title
            Center(
              child: Text(
                "Get Rich",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 29.9,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  '\$$_moneyCounter',
                  style: TextStyle(
                    color: _moneyColor,
                    fontSize: 48.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: FlatButton(
                  padding: EdgeInsets.all(15.0),
                  color: Colors.green[400],
                  textColor: Colors.white,
                  onPressed: _rainMoney,
                  child: Text("Raise Money", style: TextStyle(fontSize: 20),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
