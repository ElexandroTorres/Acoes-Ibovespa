import 'package:acoes_ibovespa/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(AcoesIbovespa());

class AcoesIbovespa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
