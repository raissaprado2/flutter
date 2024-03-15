import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animação de Movimento e Cor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovingColorChangingWidget(),
    );
  }
}

class MovingColorChangingWidget extends StatefulWidget {
  @override
  _MovingColorChangingWidgetState createState() => _MovingColorChangingWidgetState();
}

class _MovingColorChangingWidgetState extends State<MovingColorChangingWidget> {
  // Posição atual do widget
  double _xPosition = 0.0;
  double _yPosition = 0.0;

  // Cor atual do widget
  Color _currentColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animação de Movimento e Cor'),
      ),
      body: GestureDetector(
        // Utilizamos GestureDetector para detectar cliques no widget
        onTap: () {
          // Ao ser clicado, atualiza a posição e a cor
          setState(() {
            _xPosition = math.Random().nextInt(300).toDouble(); // posição X aleatória
            _yPosition = math.Random().nextInt(500).toDouble(); // posição Y aleatória
            _currentColor = _generateRandomColor(); // cor aleatória
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500), // Duração da animação
          margin: EdgeInsets.only(left: _xPosition, top: _yPosition), // Define a posição do widget
          width: 100,
          height: 100,
          color: _currentColor, // Cor que será animada
        ),
      ),
    );
  }

  // Função para gerar uma cor aleatória
  Color _generateRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0).withOpacity(1.0);
  }
}