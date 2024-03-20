import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<String> items = List.generate(5, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listagem Dinâmica',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Listagem Dinâmica'),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: ListTile(
                title: Text(
                  items[index],
                  style: TextStyle(fontSize: 18.0),
                ),
                subtitle: Text(
                  '"O resultado da Primeira Guerra Mundial foi um trauma drástico. Uma geração de jovens cresceu traumatizada com os horrores da guerra. " ${index + 1}',
                  style: TextStyle(fontSize: 14.0),
                ),
                leading: Icon(Icons.circle),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  // Ação ao clicar no item
                  print('Item ${index + 1} clicado.');
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
