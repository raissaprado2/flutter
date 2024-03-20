import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercicio 7',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercicio 7'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // Widget de fundo
            Container(
              color: Color.fromARGB(255, 14, 224, 221),
              width: 300,
              height: 300,
            ),
            // Widget sobreposto
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                color: Color.fromARGB(255, 134, 7, 160),
                width: 200,
                height: 200,
               
              ),
            ),
          ],
        ),
      ),
    );
  }
}
