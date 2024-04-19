import 'package:flutter/material.dart';
import 'package:sa3_listaexercicios/View/LoginPageView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bem Vindo",
      debugShowCheckedModeBanner: false,
      home: PaginaLogin(),
    );
  }
}

PaginaLogin() {}
