import 'package:app_to_do_list/TarefaView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_to_do_list/TarefaController.dart';

class ListaTarefasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ListaTarefasController(),
        child: ListaTarefasScreen(),
      ),
    );
  }
}
