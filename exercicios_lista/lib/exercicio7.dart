import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu de Opções',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu de Opções'),
        // Adiciona um ícone de menu na barra de aplicativo para abrir o Drawer
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      // Define o Drawer que será exibido quando o ícone de menu for pressionado
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Opções do Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Opção 1'),
              onTap: () {
                // Adicione a lógica para a ação da Opção 1 aqui
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            ListTile(
              title: Text('Opção 2'),
              onTap: () {
                // Adicione a lógica para a ação da Opção 2 aqui
                Navigator.pop(context); // Fecha o Drawer
              },
            ),
            // Adicione mais ListTiles para mais opções, se necessário
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Conteúdo da página principal',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
