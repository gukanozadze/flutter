import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);
  
  @override
  Widget build(BuildContext context) {

    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProduct({
          'title': 'Chocolate',
          'image': 'assets/butterfly.jpg',
        });
      },
      child: Text("Add Produdct" , style: TextStyle(color: Colors.white, fontSize: 15.0),),
    );
  }
}
