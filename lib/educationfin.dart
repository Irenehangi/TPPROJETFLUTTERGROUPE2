// ignore_for_file: avoid_unnecessary_containers, unused_import
import 'package:flutter/material.dart';

class MyThirdPage extends StatefulWidget {
  const MyThirdPage({super.key, required String title});

  @override
  State<MyThirdPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(15.0),
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Column(children: [
                      Text(
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                          'une institution financière est une institution publique ou privée qui assure une mission financière et qui fournit des produits et services à ses clients '),
                    ])),
                Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(15.0),
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Column(children: [
                      Text(
                        'Type d institution financière',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                      Text(
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                          'Dans le marché actuel des services financiers, une institution financière existe pour fournir une grande variété de produits de dépôt, de prêt et d’investissement aux particuliers, aux entreprises ou aux deux. Alors que certaines institutions financières se concentrent sur la fourniture de services et de comptes au grand public, d autres sont plus susceptibles de ne servir que certains consommateurs avec des offres plus spécialisées Pour savoir quelle institution financière est la plus appropriée pour répondre à un besoin spécifique, il est important de comprendre la différence entre les types d institutions et les objectifs qu elles servent.Banques centrales,Banques de détail et commerciales,Banques Internet,Les coopérative de crédit,Associations d’épargne et de crédit,Banques et entreprises d’investissement,Sociétés de courtage,Les compagnies d’assurance,Sociétés d’hypothèques.Dans ce site nous allons parler des banques, des micofinances et des coopératives en general '),
                    ])),
                Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(15.0),
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: const Column(children: [
                      Text(
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                          'UNE BANQUE'),
                      Text(
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                          'Par définition, une banque est un établissement financier, spécialiste du commerce d’argent qui assure la réception des fonds publics en vue de les utiliser pour des opérations financières ou de crédit et cela, conformément aux exigences de l’article L.311-1 du Code monétaire et financier. La commercialisation des services et produits bancaires par contre ne relève pas exclusivement de ces établissements de crédit. Il existe beaucoup d’autres organismes dont des intermédiaires qui peuvent assurer cette distribution bancaire. La banque est également soumise à l’Autorité des marchés financiers et à l’Autorité de contrôle prudentiel et de résolution. L’une des premières fonctions d’une banque consiste à assurer la gestion d’un compte bancaire. Elle met à la disposition des clients plusieurs catégories de comptes bancaires adaptées à leurs besoins. La gestion quotidienne jusqu’à la clôture du compte est ainsi assurée par l’établissement. Ce dernier s’occupe également des opérations de caisse incluant les retraits et les dépôts de fonds, les remises de chèque, les versements en espèce ou encore la gestion des oppositions.Au-delà, une banque a pour mission de fournir plusieurs produits d’épargne de type Livret A, Livret d’épargne populaire, Compte Épargne logement, Plan d épargne, assurance-vie, etc. Une de ses autres activités les plus connues porte sur les crédits bancaires. Pour concrétiser un projet, un particulier ou une entreprise peut solliciter les établissements financiers qui leur accorderont des financements. Remboursables mensuellement, ces crédits peuvent être de court ou long terme  soit 30 ans pour les crédits immobiliers.Enfin, une banque se chargera de proposer différents moyens de paiement à sa clientèle afin qu’elle puisse faire des transactions financières. Les virements bancaires, les chèques, les cartes bancaires, les paiements par internet ne sont que quelques exemples. '),
                      Image(image: AssetImage('assets/image/rawbank.PNG')),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
