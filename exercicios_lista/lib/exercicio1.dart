import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Exercicio 1'),
        ),
        body: Center (
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                 
                ),
                Container(
                  width: 150,
                  height: 50,
                  color: Colors.green,
                  
                ),
                Container(
                  width: 200,
                  height: 150,
                  color: Colors.pink,
                 
                ),
              ],
            ),
          ),
      )
    );
  }
}
