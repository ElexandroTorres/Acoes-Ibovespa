import 'package:acoes_ibovespa/model/stock.dart';
import 'package:flutter/material.dart';

class ErrorInformation extends StatelessWidget {
  const ErrorInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Erro ao tentar pesquisar informações.',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Verifique a sua conexão com a internet e tente novamente.',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
