import 'package:flutter/material.dart';
import 'package:agrow/styles.dart';
import 'package:agrow/pages/details_page.dart';

class HomeScreenBottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(

      children: <Widget>[
        SizedBox(height: 5.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Currently Watched Items", style: basicTextStyle,),
              Text("View All(13)", style: greenTextStyle,)
            ],
          ),
        ),
        Container(
          height: 210.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              PlantCard('assets/apple.jpg', 'ვაშლი', 'Apr 2019', '50', '888', '444'),
              PlantCard('assets/peach.jpg', 'ატამი', 'Apr 2019', '50', '888', '444'),
              PlantCard('assets/pineapple.jpg', 'ანანასი', 'Apr 2019', '50', '888', '444'),
              PlantCard('assets/apple.jpg', 'ვაშლი', 'Apr 2019', '50', '888', '444'),
            ],
          ),
        )
      ],
    );
  }
}

class PlantCard extends StatelessWidget {
  final String imagePath, plantName, monthYear, discount, oldPrice, newPrice;
  PlantCard(this.imagePath, this.plantName, this.monthYear, this.discount, this.oldPrice, this.newPrice);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0)
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailsPage()),
            );
          },
          child: Stack(

            children: <Widget>[
              Container(
                height: 210.0,
                width: 160.0,
                child: Image.asset(imagePath, fit: BoxFit.cover,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0)
                ),
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                width: 160.0,
                height: 70.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black87,
                        Colors.black12
                    ]),
                  ),
                ),
              ),
              Positioned(
                left: 12.0,
                bottom: 12.0,
                child: Text(plantName, style: cardTextStyle,)
              )
            ],
          ),
        ),
      ),
    );
  }
}
