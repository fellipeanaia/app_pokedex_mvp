import 'package:app_mvp/presenter/pokemon_presenter.dart';
import 'package:flutter/material.dart';
import '../model/pokemon.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PokemonPresenter presenter;

  @override
  void initState() {
    presenter = context.read<PokemonPresenter>();
    presenter.getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(right: 200),
              child: const Text('Pokedex'),
            ),
            Image.network(
              'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
              height: 30,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Consumer<PokemonPresenter>(
            builder: (_, p, w) {
              return ListView.builder(
                  itemCount: presenter.listaPokemons.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: ListTile(
                          title:
                              Text(presenter.listaPokemons[index].name ?? ''),
                          onTap: () {
                            Navigator.of(context).pushNamed('/detalhes',
                                arguments: presenter.listaPokemons[index]);
                          },
                          leading: Image.network(
                              presenter.listaPokemons[index].thumbnailImage ??
                                  ''),
                          trailing: Text(
                              '#${presenter.listaPokemons[index].number ?? ''}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 190, 190, 190))),
                        ),
                      ),
                    );
                  });
            },
          ),
          if (context.watch<PokemonPresenter>().loading)
            const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
