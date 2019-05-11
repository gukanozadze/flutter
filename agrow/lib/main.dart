import 'package:agrow/pages/details_page.dart';
import 'package:agrow/pages/home_screen_bottom_part.dart';
import 'package:flutter/material.dart';
import 'package:agrow/styles.dart';
import 'package:agrow/pages/home_screen_top_part.dart';


void main() => runApp(MaterialApp(
  title: 'Agrow',
  home: HomeScreen(),
  theme: appTheme,
));

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    ListView(
      children: <Widget>[
        HomeScreenTopPart(),
        HomeScreenBottomPart(),
      ],
    ),
    DetailsPage(),
    Text('Item 3'),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedPage,
        onTap: (int index){
          setState(() {
            _selectedPage = index;
          });
        },// this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Discover'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Community'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          )
        ],
      ),
    );
  }
}
