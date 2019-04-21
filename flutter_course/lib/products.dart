import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> products;
  
  Products(this.products){
    print("MAMA MIA");
  }
  
  @override
  Widget build(BuildContext context) {

    return Column(
      children: products
          .map(
            (e) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/butterfly.jpg'),
                      Text(e)
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}
