// ignore_for_file: non_constant_identifier_names, unused_import, unused_local_variable, unused_field
import 'package:english_words/english_words.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'orientation.dart';
import 'educationfin.dart';
import 'list_clients.dart';

void main() {
  runApp(const MyApp());
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb; // Utilise la version web
  } else {
    databaseFactory =
        databaseFactoryFfi; // Utilise la version FFI pour les autres plateformes
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ACCEUIL',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black26,
          ),
          home: const MyHomePage(),
        ));
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const MyHomePage(),
    const MySecondPage(
      title: 'ORIENTATION',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, dimens) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              extended: dimens.maxWidth >= 600,
              minExtendedWidth: 180,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.menu_open),
                  label: Text('ORIENTATION'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.search),
                  label: Text('ED FIN'),
                ),
              ],
              selectedIndex: _currentIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _currentIndex = index;
                  switch (index) {
                    case 0:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage()),
                      );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MySecondPage(
                                  title: 'ORIENTATION',
                                )),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyThirdPage(
                                  title: '',
                                )),
                      );
                  }
                });
              },
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: const GeneratorPage(),
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/image/Monde.jpg'),
            radius: 100,
          ),
          Text('BIENVENUE DANS CETTE APPLICATION'),
          SizedBox(height: 20),
          BigCard(),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.bodyMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    return Card(
      color: theme.colorScheme.onSurfaceVariant,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
            'Bienvenue dans cette application. Elle va chaque fois vous orienter dans le choix d une institution financiere. de fois on souhaite ouvrir un compte bancaire pour des differentes raisons et on ne sait pas dans quelle institution financiere s adresser. ce present logiciel va vous orienter vers quelle institution financiere ouvrir votre compte en completant les champs de la page d orientation mais aussi ce logiciel va vous presenter quelques notions de l education financiere. Cliquer sur l une de ces iconnes en côté pour choisir l operation à effectuer',
            style: style),
      ),
    );
  }
}
