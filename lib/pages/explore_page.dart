import 'package:aula_913/db/fake_db.dart';
import 'package:aula_913/widget/container_propriedade.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // For (i = 0; i < tam; i++)
      body: ListView.builder(
        // Num de repeticoes
        itemCount: FakeDatabase.listaPropriedades.length,
        // Children
        itemBuilder: (context, i) {
          return ContainerPropriedade(propriedade: FakeDatabase.listaPropriedades[i]);
        },
      ),

      // ListView(
      //   children: [
      //     buildContainer(propriedade: listaPropriedades[0]),
      //     buildContainer(propriedade: listaPropriedades[1]),
      //     buildContainer(propriedade: listaPropriedades[2]),
      //   ],
      // ),
    );
  }
}
