/*A DetailPage é a tela de detalhes que abre quando o usuário toca em um card da lista de propriedades (o ContainerPropriedade).
*Na ExplorePage:
Você tem uma lista de objetos Propriedade (vindos de algum lugar — uma lista fixa, uma API, um banco de dados etc.).
Você percorre essa lista (um ListView.builder) e, para cada Propriedade, cria um ContainerPropriedade, passando aquele objeto como parâmetro (ContainerPropriedade(propriedade: umaPropriedadeDaLista)
Isso é o "padrão" que você mencionou: um widget reutilizável (ContainerPropriedade) que recebe dados diferentes (propriedade) e se "monta" de forma parametrizada — em vez de escrever um Container do zero pra cada imóvel.

*Quando você toca em um ContainerPropriedade:
O InkWell que envolve o Container detecta o toque (onTap).
Ele dispara Navigator.push, que empilha a DetailPage por cima da ExplorePage.
Repara que ele passa widget.propriedade — ou seja, a propriedade específica daquele card que foi tocado, não uma lista nem outro card qualquer.

*Na DetailPage:
Ela recebe só aquele único objeto Propriedade e mostra informações mais detalhadas dele.

*/

import 'package:aula_913/domain/Propriedade.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  Propriedade propriedade;

  DetailPage({super.key, required this.propriedade});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // Metodo Get
  Propriedade get propriedade => widget.propriedade;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(propriedade.urlImagem),
              Positioned(
                left: 16,
                top: 16,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 32),
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Column(
            children: [
              Text(
                propriedade.local,
                style: GoogleFonts.inter(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Apartamento na Holanda',
                style: GoogleFonts.inter(fontSize: 14, color: Colors.black54),
              ),
              Text(
                '2 camas e banheiro privativo',
                style: GoogleFonts.inter(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
