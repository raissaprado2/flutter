import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Básico',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Básico'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'flutter',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.star, size: 50.0, color: Colors.yellow),
                  Text(
                    'flutter 123',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

