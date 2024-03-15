import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  TextEditingController _controllerNumero1 = TextEditingController();
  TextEditingController _controllerNumero2 = TextEditingController();
  String _resultado = '';
  int numeroSorteado = Random().nextInt(99) + 1;

  void _adivinhar() {
    int numero = int.tryParse(_controllerNumero1.text) ?? 0;

    if (numero == numeroSorteado) {
      _resultado = "Parabens!! você acertou!!";
    } else if (numero > numeroSorteado) {
      _resultado = "Errou! tente um numero menor ";
      else {
        _resultado = "Errou!! tente um numero maior";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('jogo da adivinhar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16.0),
            TextField(
              controller: _controllerNumero2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'informe um número'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _adivinhar(),
              child: Text('adivinhar'),
            ),
            SizedBox(height: 16.0),
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
