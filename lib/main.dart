import 'package:app_mvp/model/repositories/repository.dart';
import 'package:app_mvp/presenter/pokemon_presenter.dart';
import 'package:flutter/material.dart';
import 'presenter/usuario_presenter.dart';
import 'view/detalhes_page.dart';
import 'view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PokemonPresenter(Repository()),
      ),
      ChangeNotifierProvider(
        create: (context) => UsuarioPresenter(),
      ) // EXEMPLO
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const Home(),
        '/detalhes': (context) => const Detalhes(),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false, // Coloquei para tirar o Banner Debug
    );
  }
}
