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
          title: Text('Exercicio 3'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return CardItem(index: index);
          },
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final int index;

  CardItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 168, 212, 249),
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          child: Text('${index }'),
        ),
        title: Text('Qual é o principal nutriente do arroz?'),
        subtitle: Text('Os carboidratos são os principais constituintes do arroz '),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Ação quando o item é clicado
          print('Item $index clicado.');
        },
      ),
    );
  }
}
