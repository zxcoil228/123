import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSquare(),
    );
  }
}

class AnimatedSquare extends StatefulWidget {
  @override
  _AnimatedSquareState createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare> with TickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> animation;
  int colorIndex = 0;

  List<Color> colors = [    Colors.red,    Colors.blue,    Colors.green,    Colors.yellow,  ];

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );

    animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(1, 1),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.linear,
      ),
    )..addListener(() {
      setState(() {
        // Change color every second
        if (controller.value >= 0.25 * colorIndex + 0.25) {
          colorIndex++;
        }
      });
    });

    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height * animation.value.dy - 75,
            left: MediaQuery.of(context).size.width * animation.value.dx - 75,
            child: Container(
              width: 150,
              height: 150,
              color: colors[colorIndex % 4],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
