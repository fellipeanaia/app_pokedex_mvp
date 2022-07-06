import 'package:flutter/material.dart';
import '../model/pokemon.dart';

class Detalhes extends StatelessWidget {
  const Detalhes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Pokemon dados = ModalRoute.of(context)!.settings.arguments as Pokemon;
    return Scaffold(
      appBar: AppBar(
        title: Text('${dados.name}'),
      ),
      body: Card(
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 125),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: Color.fromARGB(150, 236, 236, 236)),
                        width: double.infinity,
                        child: Image.network(dados.thumbnailImage ?? '')),
                    Container(
                      alignment: Alignment.topRight,
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: Text('#${dados.number}'),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '${dados.description}',
                textAlign: TextAlign.left,
              ),
              const Divider(
                height: 30,
                thickness: 0.5,
              ),
              const Text(
                'Tipo:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(dados.type!.join('   ')),
              const Divider(
                height: 30,
                thickness: 0.5,
              ),
              const Text('Fraquezas:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 2,
              ),
              Text(dados.weakness!.join('   ')),
            ],
          ),
        ),
      ),
    );
  }
}
