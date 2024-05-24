import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import '../Model/city_db_model.dart';

class CityDbService {
  //atributos de detalhe do banco
  static const String DB_NOME = 'contacts.db' ;//Nomde do banco de dados
  static const String TABLE_NOME = 'contacts'; //Nome da tabela
  static const String CREATE_CONTACTS_TABLE_SCRIPT = //Script SQL para criar a tabela
  """CREATE TABLE cities (
    id SERIAL,
    cityname TEXT,
    favoritescities BOOLEAN)""";

  //getDatabase
  Future<Database> _getDatabase() async{
    return openDatabase(
      join(await getDatabasesPath(), DB_NOME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_CONTACTS_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }
  //closeDatabase
  
  //getAllCities
  Future<List<Map<String, dynamic>>> getAllCities() async{
    Database db = await _getDatabase();
    List<Map<String, dynamic>> result = await db.query(TABLE_NOME);
    return result;
  }
  //insertCity
  Future<void> insertCity(CityDb city) async{
    Database db = await _getDatabase();
    await db.insert(TABLE_NOME, city.toMap());
    db.close();
  }
}
