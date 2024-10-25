// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, non_constant_identifier_names, unused_import, unused_field, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'basededonnees.dart';
import 'exemple.dart';

class ListClients extends StatefulWidget {
  @override
  _TableContentPageState createState() => _TableContentPageState();
}

class _TableContentPageState extends State<ListClients> {
  @override
  void initState() {
    super.initState();
    SqliteService.initializeDB().whenComplete(() async {
      await _refreshOrientation();
    });
  }

  Orientations Un_Client = Orientations(
      nom: "default",
      postnom: "default",
      prenom: "default",
      genre: "default",
      emploi: 1 == ['emploi'],
      revenu: 0,
      raison: "default");
  // All items
  late List<Orientations> _List_clients =
      []; //used to fetch all data from the database
  Future<void> _refreshOrientation() async {
    final data = await Orientations.get_tous_clients();
    setState(() {
      _List_clients = data;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contenu de la table'),
      ),
      body: _List_clients.isEmpty
          ? Center(child: Text("Aucun client trouvé."))
          : ListView.builder(
              itemCount: _List_clients.length,
              itemBuilder: (context, index) {
                final item = _List_clients[index];
                return ListTile(
                  title: Text(item.nom),
                  subtitle: Text(
                      'Nom: ${item.nom}, Postnom: ${item.postnom}, Prénom: ${item.prenom}, Genre: ${item.genre}, Emploi: ${item.emploi}, Revenu: ${item.revenu}, Raison: ${item.raison}'),
                );
              },
            ),
    );
  }
}
