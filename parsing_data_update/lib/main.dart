import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  List _data = await getJson();
  print(_data[0]['id']);

  String name = 'koshka';


  for (var i = 0; i < _data.length; i++) {
    print("Data $i = ${_data[i]['title']}");
  }
  runApp(
    MaterialApp(
      title: 'JSON Parser',
      home: Scaffold(
        appBar: AppBar(
          title: Text('JSON Parsing'),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: ListView.builder(
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                Divider(
                  height: 5.0,
                ),
                ListTile(
                    title: Text(
                      "${_data[index]['title']}",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text("${_data[index]['body']}"),
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(_data[index]['title'][0]),
                    ),
                    onTap: () => showTapMessage(context, _data[index]['title']))
              ],
            );
            //_data[index]['title'];
          },
        ),
      ),
    ),
  );
}

void showTapMessage(BuildContext context, String message) {
  AlertDialog alertDialog = AlertDialog(
    title: Text(message),

    actions: <Widget>[
      FlatButton(
        child: Text('Ok'),
        onPressed: () => Navigator.of(context).pop(),
      ),
    ],
  );

  showDialog(context: context, builder: (context){
    return alertDialog;
  });
}

Future<List> getJson() async {
  String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  http.Response response = await http.get(apiUrl);

  return json.decode(response.body);
}
