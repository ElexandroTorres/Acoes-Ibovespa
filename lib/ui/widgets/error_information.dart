import 'package:acoes_ibovespa/model/stock.dart';
import 'package:flutter/material.dart';

class ErrorInformation extends StatelessWidget {
  const ErrorInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('assets/images/error.png'),
          Text(
            'Erro ao buscar informações',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              color: Color(0xFF072B59),
            ),
          ),
        ],
      ),
    );
  }
}
