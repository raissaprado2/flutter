import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout com Abas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabbedContent(),
    );
  }
}

class TabbedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // número de abas
      child: Scaffold(
        appBar: AppBar(
          title: Text('Conteúdo com Abas'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Aba 1'),
              Tab(text: 'Aba 2'),
              Tab(text: 'Aba 3'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Conteúdo da Aba 1
            Center(
              child: Text('Amor é um sentimento humano que mantém as pessoas conectadas e comprometidas umas com as outras.'),
            ),
            // Conteúdo da Aba 2
            Center(
              child: Text('Estar em um ambiente limpo e organizado é fundamental à saúde, integridade física e melhor aproveitamento desses espaços. A limpeza está ligada ao processo de remoção de sujeiras, bactérias e microrganismos presentes no local.'),
            ),
            // Conteúdo da Aba 3
            Center(
              child: Text('O arroz é, para o homem, uma das principais fontes de carboidratos, substâncias orgânicas que fornecem energia ao organismo, além de contribuírem para a restauração e o desenvolvimento dos tecidos. O cereal é uma boa fonte de sais minerais, como o fósforo, ferro, potássio e vitaminas'),
            ),
          ],
        ),
      ),
    );
  }
}
