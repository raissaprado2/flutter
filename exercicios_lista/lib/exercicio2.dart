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
          title: Text('Exercicio2'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle),
                  Text(
                    'Círculo',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Image.network(
                    'https://png.pngtree.com/png-clipart/20190517/original/pngtree-mouse-icon-outline-or-line-style-vector-illustration-png-image_4168155.jpg',
                    width: 65,
                    height: 65,
                    fit: BoxFit.cover, // Ajuste da imagem
                  ),
                  Icon(Icons.mouse),
                  Text(
                    'Mouse',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  SizedBox(width: 10),
                  Text(
                    'Telefone',
                    style: TextStyle(fontSize: 20),
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
