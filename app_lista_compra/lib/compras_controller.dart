import 'dart:js';

import 'package:app_lista_compra/compras_model.dart';
import 'package:flutter/material.dart';

class ListaComprasController extends ChangeNotifier {
  List<Compra> _compras = [];

  List<Compra> get compras => _compras;

  // Métodos CRUD:
  void adicionarCompra(String nome) {
    bool adicionado = false;
    if (nome.trim().isNotEmpty) {
      for (var compra in _compras) {
        // Percorre a lista de compras e verifica se o item ja foi adicionado
        if (nome.trim() == compra.nomeDoProduto) {
          adicionado = true; 
        }
      }
      if (!adicionado) {
        _compras.add(Compra(nome.trim(), false));
        notifyListeners();
      } 
    } 
  }

  void marcarComoConcluida(int indice) { // compra concluida
    if (indice >= 0 && indice < _compras.length) {
      _compras[indice].comprada = !_compras[indice]
          .comprada; 
      notifyListeners();
    }
  }

  void excluirCompra(int indice) { 
    if (indice >= 0 && indice < _compras.length) {
      _compras.removeAt(indice);
      notifyListeners();
    }
  }
}
