import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Spartak XUi'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => debugPrint("Mathafakaaa"),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => debugPrint("Mathafakaaa"),
          )
        ],
      ),
      backgroundColor: Colors.red[400],
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Spartaka Ylea",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 48.0),
            ),
            InkWell(
              child: Text(
                "Da soso",
                style: TextStyle(fontSize: 28.0),
              ),
              onTap: () => debugPrint("Button Tap"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("add"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove),
            title: Text("remove"),
          ),
        ],
        onTap: (int i) => debugPrint("Touched $i"),
      ),
    );
  }
}
