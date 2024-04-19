import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RegisterScreen(),
    );
  }
}

class User {
  final int? id;
  final String username;
  final String password;

  User({this.id, required this.username, required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
    };
  }
}

class DatabaseHelper {
  static late Database _database;

  Future<Database> get database async {
    if (_database.isOpen) {
      return _database;
    } else {
      _database = await initializeDatabase();
      return _database;
    }
  }

  Future<Database> initializeDatabase() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password TEXT)",
      );
    }, version: 1);
  }

  Future<int> insertUser(User user) async {
    final db = await database;
    return db.insert('users', user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<bool> isUsernameExists(String username) async {
    final db = await database;
    List<Map<String, dynamic>> maps =
        await db.query('users', where: 'username = ?', whereArgs: [username]);
    return maps.isNotEmpty;
  }
}

class RegisterScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String username = _usernameController.text;
                String password = _passwordController.text;

                bool usernameExists =
                    await _databaseHelper.isUsernameExists(username);

                if (usernameExists) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Erro'),
                      content: Text('Nome de usuário já existe.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else {
                  User newUser =
                      User(username: username, password: password, id: null);
                  await _databaseHelper.insertUser(newUser);
                  Navigator.pop(context);
                }
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
