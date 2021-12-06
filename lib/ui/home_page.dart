import 'package:flutter/material.dart';
import 'package:acoes_ibovespa/api/hg_finance_api.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String acao = '';
  HGFinanceApi hgApi = HGFinanceApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ações Ibovespa'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                acao = value;
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Nome da ação',
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () {
                hgApi.makeRequest(acao);
              },
              child: Text('Pesquisar'),
            ),
          ],
        ),
      ),
    );
  }
}
