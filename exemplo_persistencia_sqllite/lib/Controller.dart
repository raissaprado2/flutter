import 'package:exemplo_persistencia_sqllite/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BancoDadosCrud {
  // Atributos
  static const String DB_NOME = 'contacts.db'; // Nome do banco de dados
  static const String TABLE_NOME = 'contacts'; // Nome da tabela
  static const String
      CREATE_CONTACTS_TABLE_SCRIPT = // Script SQL para criar a tabela
      "CREATE TABLE IF NOT EXISTS contacts(id INTEGER PRIMARY KEY," +
          "nome TEXT, email TEXT, telefone TEXT," +
          "endereco TEXT, login TEXT)";

  Future<Database> _getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), DB_NOME), // Caminho do banco de dados
      onCreate: (db, version) {
        return db.execute(
            CREATE_CONTACTS_TABLE_SCRIPT); // Executa o script de criação da tabela quando o banco é criado
      },
      version: 1,
    );
  }

  // Método para criar um novo contato no banco de dados
  Future<void> create(ContatoModel model, String login) async {
    try {
      final Database db = await _getDatabase();
      await db.insert(
        TABLE_NOME,
        {
          ...model.toMap(),
          'login': login
        }, // Insere o contato no banco de dados com o login
      );
    } catch (ex) {
      print(ex);
      return;
    }
  }
}

// Método para obter todos os contatos do banco de dados
Future<List<ContatoModel>> getContacts() async {
  try {
    final Database db = await _getDatabase();
    final List<Map<String, dynamic>> maps = await db
        .query(TABLE_NOME as String); // Consulta todos os contatos na tabela

    return List.generate(
      maps.length,
      (i) {
        return ContatoModel.fromMap(maps[
            i]); // Converte os resultados da consulta para objetos ContactModel
      },
    );
  } catch (ex) {
    print(ex);
    return [];
  }
}

class TABLE_NOME {}

_getDatabase() {}

// Método para atualizar um contato no banco de dados
Future<void> update(ContatoModel model) async {
  try {
    final Database db = await _getDatabase();
    await db.update(
      TABLE_NOME as String,
      model.toMap(),
      where: "id = ?", // Condição para atualizar o contato com base no ID
      whereArgs: [model.id],
    );
  } catch (ex) {
    print(ex);
    return;
  }
}

// Método para excluir um contato do banco de dados
Future<void> delete(int id) async {
  try {
    final Database db = await _getDatabase();
    await db.delete(
      TABLE_NOME as String,
      where: "id = ?", // Condição para excluir o contato com base no ID
      whereArgs: [id],
    );
  } catch (ex) {
    print(ex);
    return;
  }
}
