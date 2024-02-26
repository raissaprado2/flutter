import 'package:app_lista1/TarefaModel.dart';

import 'package:flutter/material.dart';

class ListaTrefasControler extends ChangeNotifier {
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  //metodos CRUD
  void adicionarTarefa(String descricao) {
    _tarefas.add(Tarefa(descricao, false));
    notifyListeners();
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      notifyListeners();
    }
  }

  void excluirTarefa(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.removeAt(indice);
      notifyListeners();
    }
  }
}
