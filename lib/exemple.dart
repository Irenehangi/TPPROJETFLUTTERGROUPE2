// ignore_for_file: unused_import, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'basededonnees.dart';

class Orientations {
  late final String nom;
  late final String postnom;
  late final String prenom;
  late final String genre;
  late final bool emploi;
  late final double revenu;
  late final String raison;

  Orientations(
      {required this.nom,
      required this.postnom,
      required this.prenom,
      required this.genre,
      required this.emploi,
      required this.revenu,
      required this.raison});

  Orientations.fromMap(Map<String, dynamic> item) {
    nom = item["nom"];
    postnom = item["postnom"];
    prenom = item["prenom"];
    genre = item["genre"];
    emploi = item["emploi"];
    revenu = item["revenu"];
    raison = item["raison_ouverture"];
  }

  Map<String, Object> Orientations_toMap() {
    return {
      'nom': nom,
      'postnom': postnom,
      'prenom': prenom,
      'genre': genre,
      'emploi': emploi ? 1 : 0,
      'revenu': revenu,
      'raison_ouverture': raison
    };
  }

  //Méthode d'insertion
  Future<int> insert_clients(BuildContext un_context) async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      final Database db = await SqliteService.initializeDB();

      // Vérifiez ici que toutes les valeurs sont valides avant l'insertion
      if (nom.isEmpty || postnom.isEmpty || prenom.isEmpty || revenu <= 0) {
        throw Exception("Un ou plusieurs champs sont invalides.");
      }

      final nomId = await db.insert(
        "Orientations",
        Orientations_toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      // Affichage de message en bas de la page
      ScaffoldMessenger.of(un_context).showSnackBar(
        const SnackBar(
          content: Text('Insertion réussie avec succès'),
          backgroundColor: Colors.green,
        ),
      );
      return nomId;
    } catch (err) {
      debugPrint("Erreur lors de l'insertion : $err");

      ScaffoldMessenger.of(un_context).showSnackBar(
        SnackBar(
          content: Text('Erreur dans l\'insertion : $err'),
          backgroundColor: Colors.red,
        ),
      );
      return 1111; // Code d'erreur personnalisé
    }
  }

  /*Suppression d'un enregistrement
  static Future<void> delete_etu(String _Matricule, BuildContext context) async {
    final db = await SqliteService.initializeDB();
    try {
      await db.delete("Etudiants", where: "Matricule = ?", whereArgs: [_Matricule]);
      print('Suppression avec succès');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Suppression reussi avec succès'),
          backgroundColor: Colors.red,
        ),
      );
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Echec de la Suppression: $err'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
*/
  //Selection de tous les enregistrements
  static Future<List<Orientations>> get_tous_clients() async {
    final db = await SqliteService.initializeDB();
    final List<Map<String, Object?>> queryResult =
        await db.query("Orientations", orderBy: 'nom'); //,
    return queryResult.map((e) => Orientations.fromMap(e)).toList();
  }
/*
  //Selection d'un enreigistrement
  static Future<List<Etudiants>> get_Un_Etudiant(String Matricule_Rech) async {
    final db = await SqliteService.initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query("Etudiants",
        where: "Matricule = ?",
        whereArgs: [Matricule_Rech]); //,
    return queryResult.map((e) => Etudiants.fromMap(e)).toList();
  }
*/
}
