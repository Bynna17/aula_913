/*Método: Método	
*Executa uma lógica e retorna um valor
*Chamado como minhaFuncao()	
*Não tem estado próprio (a menos que manipule algo externo)	
*Vive dentro de uma classe

Classe Widget: 	Classe Widget
*Representa um componente visual completo
*Instanciado como MeuWidget(parametros)
*Pode ter seu próprio estado (StatefulWidget)
*É uma classe em si (extends StatelessWidget ou StatefulWidget)
*Se a intenção é usar esse componente em várias telas diferentes do app, 
definitivamente vale a pena ser uma classe widget separada (em outro arquivo,
como já é o caso do container_propriedade.dart) - uso um widget para todas as propriedades(caixa de informação sobre
o lugar específico do Airbnb), com características definidas, onde as características específicas vêm do objeto propriedade,nque entra como parâmetro no Explore Page*/

import 'package:aula_913/domain/Propriedade.dart';
import 'package:aula_913/pages/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerPropriedade extends StatefulWidget {
  Propriedade propriedade;

  ContainerPropriedade({super.key, required this.propriedade});

  @override
  State<ContainerPropriedade> createState() => _ContainerPropriedadeState();
}

class _ContainerPropriedadeState extends State<ContainerPropriedade> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return DetailPage(propriedade: widget.propriedade);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: [
                ClipRRect(
                  child: Image.network(
                    widget.propriedade.urlImagem,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                Positioned(
                  child: Icon(Icons.favorite, size: 36, color: Color(0xFFE41D56)),
                  top: 16,
                  right: 16,
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.propriedade.local,
                  style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(children: [Icon(Icons.star, size: 16), buildText('4.76')]),
              ],
            ),
            buildText(widget.propriedade.host),
            buildText(widget.propriedade.dates),
            buildText(widget.propriedade.total),
          ],
        ),
      ),
    );
  }

  onTapContainer() {}

  buildText(String text) {
    return Text(text, style: GoogleFonts.inter());
  }
}
