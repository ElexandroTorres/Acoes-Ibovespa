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
  Widget mostrar = Text('Aguardando');

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
                labelText: 'Nome da ação',
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () async {
                hgApi.makeRequest(stockSymbol);
                /*
                setState(() {
                  mostrar = Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                });
                stockData = await hgApi.makeRequest(stockSymbol);
                setState(() {
                  mostrar = stockInformation(stockData);
                });
                */
                /*
                setState(() {
                  stockData;
                });
                */
              },
              child: Text('Pesquisar'),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                child: Card(
                  elevation: 2,
                  borderOnForeground: true,
                  margin: EdgeInsets.all(16),
                  child: mostrar,
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
  if (stockData.symbol == '') {
    return Text('Sem Dados');
  } else {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
            fontSize: 12,
          ),
        ),
        Text('company name: ${stockData.companyName}'),
        Text(stockData.description.toString()),
        Text('marketcap: ${stockData.marketCap}'),
        Text('price: ${stockData.price}'),
        Text('update at: ${stockData.updatedAt}'),
      ],
    );
  }
}



/*
child: FutureBuilder(
                    future: hgApi.makeRequest(stockSymbol),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.black,
                            ),
                          );
                        default:
                          if (snapshot.hasError) {
                            return Center(
                              child: Text('Digite alguma ação acima'),
                            );
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('symbol: ${stockData.symbol}'),
                                Text('name: ${stockData.name}'),
                                Text('company name: ${stockData.companyName}'),
                                Text('Description: ${stockData.description}'),
                                Text('marketcap: ${stockData.marketCap}'),
                                Text('price: ${stockData.price}'),
                                Text('update at: ${stockData.updatedAt}'),
                              ],
                            );
                          }
                      }
                    },
                  ),

 */