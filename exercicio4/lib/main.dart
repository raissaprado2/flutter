import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário de Cadastro',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Formulário de Cadastro'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: SignUpForm(),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _email = '';
  String _password = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Aqui você pode processar os dados do formulário, como enviar para um servidor, por exemplo.
      print('Nome: $_name');
      print('E-mail: $_email');
      print('Senha: $_password');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Nome'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira o seu nome.';
              }
              return null;
            },
            onSaved: (value) {
              _name = value!;
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(labelText: 'E-mail'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira o seu e-mail.';
              }
              // Você pode adicionar validação adicional para o formato do e-mail se desejar.
              return null;
            },
            onSaved: (value) {
              _email = value!;
            },
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(labelText: 'Senha'),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira a sua senha.';
              }
              // Você pode adicionar validação adicional para a força da senha se desejar.
              return null;
            },
            onSaved: (value) {
              _password = value!;
            },
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Cadastrar'),
          ),
        ],
      ),
    );
  }
}
