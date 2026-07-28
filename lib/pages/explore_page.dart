import 'package:aula_913/db/propriedade_dao.dart';
import 'package:aula_913/domain/Propriedade.dart';
import 'package:aula_913/widget/container_propriedade.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // Lista de Propriedades inicia vazia
  List<Propriedade> listaPropriedades = [];

  @override
  void initState() {
    super.initState();
    // É necessário pois o initState não permite parar a tela (uso do await)
    loadData();
  }

  // Carregar os dados do Banco de Dados
  loadData() async {
    listaPropriedades = await PropriedadeDao().listarPropriedades();
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // For (i = 0; i < tam; i++)
      body: ListView.builder(
        // Num de repeticoes
        itemCount: listaPropriedades.length,
        // Children
        itemBuilder: (context, i) {
          return ContainerPropriedade(propriedade: listaPropriedades[i]);
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
