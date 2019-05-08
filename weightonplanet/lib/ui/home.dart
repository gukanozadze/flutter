import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _weightController = TextEditingController();
  int radioValue = -1;
  double _finalResult = 0.0;
  String _formatedText = '';

  void handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;
      switch (value) {
        case 0: // Mars
          _finalResult = calculateWeight(_weightController.text, 0.38);
          _formatedText = 'Your Weight on Mars is ${_finalResult.toStringAsFixed(2)}';
          break;
        case 1: // Pluto
          _finalResult = calculateWeight(_weightController.text, 0.06);
          _formatedText = 'Your Weight on Pluto is ${_finalResult.toStringAsFixed(2)}';
          break;
        case 2: // venus
          _finalResult = calculateWeight(_weightController.text, 0.91);
          _formatedText = 'Your Weight on Venus is ${_finalResult.toStringAsFixed(2)}';
          break;
      }
    });
  }

  double calculateWeight(String text, double value){
    if(int.parse(text) > 0 && int.parse(text).toString().isNotEmpty){
      return int.parse(text) * value;
    }else{
      print("Wrong");
      return int.parse('180') * 2.5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight On Planet'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: EdgeInsets.all(2.5),
          children: <Widget>[
            Image.asset(
              'images/planet.png',
              height: 133.0,
              width: 200.0,
            ),
            Container(
              margin: EdgeInsets.all(3.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  TextField(
                    onEditingComplete: () {
                      handleRadioValueChange(radioValue);
                      FocusScope.of(context).requestFocus(new FocusNode()); // Dissmis Keyboard
                    },
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Your Weight on Earth',
                        hintText: 'In Pounds',
                        icon: Icon(Icons.person_outline)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Row(
                    // Three Radio Buttons
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Radio<int>(
                        activeColor: Colors.red,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChange),
                      Text('Mars'),

                      Radio<int>(
                        activeColor: Colors.brown,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChange),
                      Text('Pluto'),
                      
                      Radio<int>(
                        activeColor: Colors.orange,
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChange),
                      Text('Venus'),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                  ),
                  // Result Text
                  Text(
                    
                    _weightController.text.isEmpty || radioValue == -1 ? 'Please Enter Weight and Select Planet' : '$_formatedText Pounds',
                    style: TextStyle(fontSize: 17.4,fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
