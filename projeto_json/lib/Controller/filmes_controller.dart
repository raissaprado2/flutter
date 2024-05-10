import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:projeto_json/Model/filme_model.dart';

class FilmesController{
  //atributo
  List<Filme> _ListFilmes = [];
  //get
  List<Filme> get listFilme => _ListFilmes;
  //métodos salvar / carregar json
   Future <void> saveFilmestoJson () async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    final file = File('$path/carros.json');
    final jsonList = _ListFilmes.map((filme) => filme.Json()).toList();
    await file.writeAsString(jsonEncode(jsonList));
  }
  Future <List<Filme>> loadFilmesfromJson() async {
    try {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;
    final file = File('$path/filmes.json');
    final jsonList = jsonDecode(await file.readAsStringSync());
    _ListFilmes = jsonList.map<Filme>((json) => Filme.fromJson(json)).toList();
    } catch (e) {
      _ListFilmes = [];
    }
    return _ListFilmes;
  }
  //método adicionar
  void addFilme(Filme filme){
    _ListFilmes.add(filme);
  }
}