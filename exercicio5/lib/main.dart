import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Responsivo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Responsivo'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              // Para telas maiores
              return WideLayout();
            } else {
              // Para telas menores
              return NarrowLayout();
            }
          },
        ),
      ),
    );
  }
}

class WideLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          width: 200,
          height: 200,
          child: Center(
            child: Text(
              'Widget 1',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
        SizedBox(width: 20),
        Container(
          color: Colors.green,
          width: 200,
          height: 200,
          child: Center(
            child: Text(
              'Widget 2',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}

class NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.blue,
          width: 200,
          height: 200,
          child: Center(
            child: Text(
              'Widget 1',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          color: Colors.green,
          width: 200,
          height: 200,
          child: Center(
            child: Text(
              'Widget 2',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ],
    );
  }
}
