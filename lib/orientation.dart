// ignore_for_file: avoid_unnecessary_containers, unused_import, unused_element, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'educationfin.dart';
import 'main.dart';
import 'package:path/path.dart';
import 'basededonnees.dart';
import 'exemple.dart';
import 'list_clients.dart';

class MySecondPage extends StatefulWidget {
  const MySecondPage({super.key, required String title});

  @override
  State<MySecondPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MySecondPage> {
  final formKey = GlobalKey<FormState>();
  String _nom = "";
  String _postnom = "";
  String _prenom = "";
  int _genre = 0;
  double _revenu = 0;
  String _raison = "Pour garder simplement de l argent";
  bool _emploi = false;
  bool _emploi1 = false;
  bool _emploi2 = false;

  String dropdownValue = 'Pour garder simplement de l argent';
  TextEditingController control_description = TextEditingController();
  void _handleRadioValueChange(int value) {
    setState(() {
      _genre = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(25.0),
              margin: const EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                children: <Widget>[
                  const Text(
                    'VEILLEZ COMPLETER CES CHAMPS ICI BAS POUR QU ON SACHE VERS QUELLE INSTITUTION FINANCIRE VOUS ORIENTER',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 26, 23, 23),
                    ),
                  ),
                  const SizedBox(
                      height:
                          16.0), // Espacement entre les widgets Text et TextField
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Entrez votre nom svp',
                      hintStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 5, color: Colors.white10),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      prefixIcon: const Icon(Icons.person_2_rounded),
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (input) =>
                        input!.isEmpty ? 'Entrez un nom SVP' : null,
                    onSaved: (input) => _nom = input!,
                  ),

                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Entrez votre postnom svp',
                        hintStyle: const TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 5, color: Colors.white10),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(Icons.person_2_rounded)),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    validator: (input) =>
                        input!.isEmpty ? 'Entrez un postnom SVP' : null,
                    onSaved: (input) => _postnom = input!,
                  ),
                  const SizedBox(height: 16.0),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Entrez votre prenom svp',
                        hintStyle: const TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 5, color: Colors.white10),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(Icons.person_2_rounded)),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    validator: (input) =>
                        input!.isEmpty ? 'Entrez un nom SVP' : null,
                    onSaved: (input) => _prenom = input!,
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'GENRE:',
                    style: TextStyle(fontSize: 12.0, color: Colors.white),
                  ),

                  RadioListTile(
                    title: const Text('Feminin'),
                    value: 1,
                    groupValue: _genre,
                    onChanged: (value) {
                      setState(() {
                        _genre = int.parse(value.toString());
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Masculin'),
                    value: 2,
                    groupValue: _genre,
                    onChanged: (value) {
                      setState(() {
                        _genre = int.parse(value.toString());
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Autre'),
                    value: 3,
                    groupValue: _genre,
                    onChanged: (value) {
                      setState(() {
                        _genre = int.parse(value.toString());
                      });
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      const Text(
                        'QUEL EST VOTRE TRAVAIL?:   ',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Checkbox(
                        value: _emploi,
                        onChanged: (value) {
                          setState(() {
                            _emploi = value!;
                          });
                        },
                      ),
                      const Text(
                        'COMMERCANT',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Checkbox(
                        value: _emploi1,
                        onChanged: (value) {
                          setState(() {
                            _emploi1 = value!;
                          });
                        },
                      ),
                      const Text(
                        'CASCADEUR',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Checkbox(
                        value: _emploi2,
                        onChanged: (value) {
                          setState(() {
                            _emploi2 = value!;
                          });
                        },
                      ),
                      const Text(
                        'SALARIE',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ],
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                        hintText:
                            'Entrez votre revenu mensuel en franc congolais svp',
                        hintStyle: const TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 5, color: Colors.white10),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        prefixIcon: const Icon(Icons.money)),
                    style: const TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Entrez un montant SVP';
                      }
                      // Assurez-vous que l'entrée peut être convertie en double
                      return double.tryParse(input) == null
                          ? 'Entrez un nombre valide SVP'
                          : null;
                    },
                    onSaved: (input) => _revenu = double.parse(input!),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      const Text(
                        'POURQUOI VOUS VOULEZ OUVRIR UN COMPTE? :   ',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      DropdownButton<String>(
                        value: _raison,
                        items: <String>[
                          'Pour garder simplement de l argent',
                          'pour solliciter un credit',
                          'pour eparger à long terme',
                          'pour autre chose'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _raison = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              _ajouter_client(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyThirdPage(
                                            title: '',
                                          )));
                            },
                            child: const Text(
                                'cliquer ici pour avoir une orientation')),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListClients()));
                          },
                          child: const Text(
                              'Voir les clients qui ont deja eu une orientation'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  void _ajouter_client(BuildContext context) {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      debugPrint(
          "Nom: $_nom, Postnom: $_postnom, Prenom: $_prenom, Genre: $_genre, Emploi: $_emploi, Revenu: $_revenu, Raison: $_raison");

      Orientations newOrientation = Orientations(
        nom: _nom,
        postnom: _postnom,
        prenom: _prenom,
        genre: _genre.toString(),
        emploi: _emploi,
        revenu: _revenu,
        raison: _raison,
      );

      newOrientation.insert_clients(context).then((value) {
        if (value == 1111) {
          debugPrint('Erreur lors de l\'insertion');
        } else {
          debugPrint('Insertion réussie avec succès');
        }
      });
    } else {
      debugPrint('Erreur de validation');
    }
  }
}
