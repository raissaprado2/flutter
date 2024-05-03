import 'package:flutter/material.dart';


class FilmeCadastroScreen extends StatefulWidget {
  const FilmeCadastroScreen({super.key});

  @override
  State<FilmeCadastroScreen> createState() => _FilmeCadastroScreenState();
}

class _FilmeCadastroScreenState extends State<FilmeCadastroScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  
  get _nomeController => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Filme'),
      ), 
      body: Center(
        child: Form(
          child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: "Nome do filme" ),
            controller: _nomeController,
            validator: (value) {
            if(value!.trim().isEmpty){
              return "nome do filme deve ser preenchido";
            }else{
              return null;
            }
         }),
         ElevatedButton(
          onPressed: ()=> {
            if(_formkey.currentState!.validate()){
               _cadastrarFilme()
            }
          },
          child: const Text("cadastrar"),
          )
        ]
      ),
    ),
      ),
    );
  }
  
  void _cadastrarFilme() {}
  //méodo para cadastrar filmes no json
  //chamar classe controller
}

class _formkey {
  static var currentState;
}