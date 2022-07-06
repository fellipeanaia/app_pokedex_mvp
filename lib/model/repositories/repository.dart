import 'dart:convert';
import 'package:app_mvp/model/pokemon.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<List<Pokemon>> getPokemons() async {
    Uri url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');

    List<Pokemon> listaPokemons = [];

    final resultado = await http.get(url);

    if (resultado.statusCode == 200) {
      Map json = const JsonDecoder().convert(resultado.body);

      for (var element in (json['data'] as List)) {
        listaPokemons.add(Pokemon.fromJson(element));
      }

      return listaPokemons;
    }

    return listaPokemons;
  }
}
