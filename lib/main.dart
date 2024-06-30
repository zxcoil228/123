import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _buttonColor = Colors.blue;

  void _changeColor(Color color) {
    setState(() {
      _buttonColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('кнопка меняет цвет'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                _changeColor(Colors.red);
              },
              child: Text('красный'),
            ),
            ElevatedButton(
              onPressed: () {
                _changeColor(Colors.green);
              },
              child: Text('зеленый'),
            ),
            ElevatedButton(
              onPressed: () {
                _changeColor(Colors.blue);
              },
              child: Text('голубой'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                    if (states.contains(MaterialState.pressed)) return Colors.black;
                    return _buttonColor;
                  },
                ),
              ),
              onPressed: () {},
              child: Text('Меняй цвет'),
            ),
          ],
        ),
      ),
    );
  }
}
