import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:acoes_ibovespa/api/hg_finance_api.dart';
import 'package:acoes_ibovespa/model/stock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? stockSymbol;
  HGFinanceApi hgApi = HGFinanceApi();
  late Stock stockData;
  String teste = '';
  Widget? showInformations;

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
                stockSymbol = value;
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Digite o simbolo da ação',
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () async {
                setState(() {
                  showInformations = Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                });
                stockData = await hgApi.makeRequest(stockSymbol);
                setState(() {
                  showInformations = stockInformation(stockData);
                });
              },
              child: Text('Pesquisar'),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Card(
                  color: Colors.grey,
                  elevation: 2,
                  borderOnForeground: true,
                  margin: EdgeInsets.all(4),
                  child: showInformations,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget stockInformation(Stock stockData) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                stockData.symbol.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                stockData.name.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        //flex: 2,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'R\$ ${stockData.price}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              Text(
                '${stockData.changePercent}%',
                style: TextStyle(
                  color:
                      stockData.changePercent! >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(
        child: Container(
          //margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.bottomRight,
            child: Text(
                'Ultima atualização as ${DateTime.parse(stockData.updatedAt.toString()).hour}:${DateTime.parse(stockData.updatedAt.toString()).minute} '),
          ),
        ),
      ),
    ],
  );
}
