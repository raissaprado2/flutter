import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Integração de Imagem',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageExample(),
    );
  }
}

class ImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Integração de Imagem'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Carregar imagem de uma URL externa
            Image.network(
              'https://www.google.com/url?sa=i&url=https%3A%2F%2Fescolakids.uol.com.br%2Fciencias%2Ftiranossauro-rex.htm&psig=AOvVaw2tLDeJaGSen5WOKYJfHtIk&ust=1710871714927000&source=images&cd=vfe&opi=89978449&ved=2ahUKEwir4-73s_6EAxWTNTUKHYuUDVsQjRx6BAgAEBc',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            // Carregar imagem de recursos locais
            Image.asset(
              'assets/img.jpg',
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
