import 'package:flutter/material.dart';

class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

// Data Class
class _LoginData {
  String name = '';
  String password = '';

  @override
  String toString() {
    // TODO: implement toString
    return "$name $password";
  }
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  final _formKey = GlobalKey<FormState>();

  _LoginData _data = new _LoginData();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // add image
          Center(
            child: Image.asset(
              'images/face.png',
              width: 90,
              height: 90,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: TextFormField(
              // Name field
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  gapPadding: 3.3,
                  borderRadius: BorderRadius.circular(5.3),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter Name";
                } else {
                  // Show Something
                  _data.name = value;
                  print(_data);
                }
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(12.0),
            child: TextFormField(
              // Password Field
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  gapPadding: 3.3,
                  borderRadius: BorderRadius.circular(5.3),
                ),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter password';
                } else {
                  _data.password = value;
                  print(_data);
                }
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Submit Button
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      setState(() {
                        _data.name = _data.name;
                      });

                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text("All Good"),
                        ),
                      );
                    }
                  },
                  child: Text('Submit'),
                ),

                // Clear Button
                RaisedButton(
                  onPressed: () {
                    _formKey.currentState.reset();
                    setState(() {
                     _data.name = ''; 
                    });
                  },
                  child: Text('Clear'),
                ),
              ],
            ),
          ),
          Text('Hello ${_data.name}'),
        ],
      ),
    );
  }
}
