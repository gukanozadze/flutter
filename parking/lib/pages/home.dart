import 'package:flutter/material.dart';
import 'dart:math' as math;

import './booking.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController controller;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  Widget timerWidget = Container();

  startTimer() {
    setState(() {
      if (controller.isAnimating) {
        controller.stop();
      } else {
        timerWidget = AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget child) {
              return Text(
                timerString,
                style: TextStyle(color: Colors.greenAccent, fontWeight: FontWeight.bold),
              );
            });
        controller.reverse(
            from: controller.value == 0.0 ? 1.0 : controller.value);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 600),
    );
  }

  void showModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xff6D2727), // Outer Color

          height: 250.0, // Height of container
          child: Container(
            decoration: BoxDecoration( // Radius Decorator
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 50.0,
                ),
                Center(
                  child: Text(
                    'ნამდვილად გსურთ დაჯავშნა?',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                Container(
                  height: 50.0,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          startTimer();
                          Navigator.pop(context);
                        },
                        color: Colors.green,
                        child: Text(
                          'კი',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        width: 50.0,
                      ),
                      RaisedButton(
                        color: Colors.red[400],
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'არა',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking'),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsetsDirectional.only(end: 30.0),
            icon: Icon(Icons.directions_car),
            onPressed: () {
              showModal();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('თავისუფალი ადგილები'),
            Container(
              padding: EdgeInsets.all(10.0),
            ),
            Text(
              '13',
              style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 40.0,
            ),
            timerWidget
          ],
        ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final Animation<double> animation;
  final Color backgroundColor, color;

  TimerPainter({this.animation, this.backgroundColor, this.color})
      : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
