import 'dart:ui';

import 'package:acoes_ibovespa/model/stock_fake_data.dart';
import 'package:acoes_ibovespa/ui/widgets/stock_information.dart';
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
  Stock? stockData = null;
  String teste = '';

  //Widget? showInformations;
  //Widget? showInformations = stockInformation(fakeStock);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ações Ibovespa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                  stockData = await hgApi.makeRequest(stockSymbol);
                  setState(() {});
                },
                child: Text('Pesquisar'),
              ),
              StockInformation(
                stockData: stockData ?? fakeStock,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
