import 'dart:ui';
import 'package:acoes_ibovespa/model/stock_fake_data.dart';
import 'package:acoes_ibovespa/ui/widgets/error_information.dart';
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

  AplicationStates() {
    switch (hgApi.state.value) {
      case ApiCallState.start:
        return Container(
          margin: EdgeInsets.only(top: 8),
          child: Image.asset('assets/images/bear_market.png'),
        );
      case ApiCallState.loading:
        return CircularProgressIndicator();
      case ApiCallState.success:
        return StockInformation(stockData: stockData!);
      case ApiCallState.error:
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              AnimatedBuilder(
                  animation: hgApi.state,
                  builder: (context, child) {
                    return AplicationStates();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
