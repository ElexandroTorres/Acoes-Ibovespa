import 'package:acoes_ibovespa/ui/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(AcoesIbovespa());

class AcoesIbovespa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      title: 'Ações Ibovespa',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Color(0xFF072B59),
          secondary: Color(0xFF264773),
        ),
      ),
      home: HomePage(),
    );
  }
}
