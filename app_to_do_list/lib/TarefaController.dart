import 'package:app_to_do_list/TarefaModel.dart';
import 'package:flutter/material.dart';

class ListaTarefasController extends ChangeNotifier {
  List<Tarefa> _tarefas = [];

  List<Tarefa> get tarefas => _tarefas;

  // Métodos CRUD:
  void adicionarTarefa(String descricao) {
    if (descricao.trim().isNotEmpty) {
      _tarefas.add(Tarefa(descricao.trim(), false));
      notifyListeners();
    }

    void marcarComoConcluida(int indice) {
      if (indice >= 0 && indice < _tarefas.length) {
        if (_tarefas[indice].concluida = true) {
          _tarefas[indice].concluida = false;
        } else {
          _tarefas[indice].concluida = true;
        }
        // Notifica os ouvintes sobre a mudança no estado
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
}
