import 'package:flutter/material.dart';




class InputTextFields extends StatefulWidget {
  @override
  _InputTextFieldsState createState() => _InputTextFieldsState();
}

class _InputTextFieldsState extends State<InputTextFields> {

  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  Color _labelColor = Colors.white;
  TextStyle _myTextStyle = TextStyle(color: Colors.white, fontSize: 20.0);
  TextStyle _buttonTextStyle = TextStyle(color: Colors.white, fontSize: 16.0);

  double _BMI = 0.0;

  calculateBMI(){
    setState(() {
      _BMI = (double.parse(weightController.text) / (double.parse(heightController.text) * double.parse(heightController.text)));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: ageController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Age',

            icon: Icon(Icons.person, color: _labelColor,),
            labelStyle: TextStyle(color: _labelColor,),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: _labelColor
                )
            ),
          ),
        ),
        TextField(
          controller: heightController,
          keyboardType: TextInputType.number,

          decoration: InputDecoration(
            labelText: 'Height In M',
            icon: Icon(Icons.insert_chart, color: _labelColor,),
            labelStyle: TextStyle(color: _labelColor,),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: _labelColor
                )
            ),
          ),
        ),
        TextField(
          controller: weightController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Weight in KG',

            icon: Icon(Icons.line_weight, color: _labelColor,),
            labelStyle: TextStyle(color: _labelColor,),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: _labelColor
                )
            ),
          ),
        ),
        Padding(padding: EdgeInsets.all(12.0),),
        RaisedButton(
          onPressed: calculateBMI,
          color: Colors.redAccent,
          padding: EdgeInsets.all(12.0),
          child: Text('Calculate', style: _buttonTextStyle,),
        ),
        Padding(padding: EdgeInsets.all(12.0),),
        Text('${_BMI.toStringAsFixed(2)}', style: _myTextStyle),
        Padding(padding: EdgeInsets.all(12.0),),
      ],
    );
  }
}

