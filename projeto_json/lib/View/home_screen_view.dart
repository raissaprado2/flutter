import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mundo Do Cinema'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           ElevatedButton( 
          onPressed: ()=> Navigator.pushNamed(context, "/list"), 
          child: Text('Lista de Filmes')),
          SizedBox(height: 20,),
          ElevatedButton( 
          onPressed: ()=> Navigator.popAndPushNamed(context, "/cadastro"), 
          child: Text('Cadastro de Filme')),
          
         
          ],
        ),
      ),
    );
  }
}