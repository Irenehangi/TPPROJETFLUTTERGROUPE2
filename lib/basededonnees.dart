import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  static Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    if (kDebugMode) {
      print("====> Chemin BDD: $path");
    }
    return openDatabase(
      join(path, 'dbtravailpratique.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Orientations(nom TEXT PRIMARY KEY, postnom TEXT NOT NULL, prenomnom TEXT NOT NULL, genre TEXT, emploi INTEGER DEFAULT 0, revenu INTEGER, raison_ouverture TEXT)",
        );
      },
      version: 1,
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('SQLite Demo')),
        body: const Center(child: Text('Hello World')),
      ),
    );
  }
}
