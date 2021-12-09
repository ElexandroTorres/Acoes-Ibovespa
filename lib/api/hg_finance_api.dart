import 'dart:convert';
import 'package:acoes_ibovespa/api/hg_finance_api_infos.dart';
import 'package:http/http.dart' as http;
import 'package:acoes_ibovespa/model/stock.dart';

class HGFinanceApi {
  Future<Stock> makeRequest(String? stockSymbol) async {
    String request = '$url&symbol=$stockSymbol';
    Map<String, dynamic> stockData;
    Map<String, dynamic> stockResults;
    Stock stock;

    http.Response response = await http.get(Uri.parse(request));

    stockData = jsonDecode(response.body);

    String symbol = stockData['results'].keys.first;

    // The 'error' is only avaliable when the api returns an invalid symbol json.
    if (stockData['results'][symbol]['error'] != null) {
      stock = Stock.noData();
      return stock;
    }

    stockResults = stockData['results'][symbol];

    stock = Stock.fromJson(stockResults);

    print('Stock infos:');
    print('symbol : ${stock.symbol}');
    print('name: ${stock.name}');
    print('company name : ${stock.companyName}');
    print('description: ${stock.description}');
    print('marketcap: ${stock.marketCap}');
    print('price: ${stock.price}');
    print('change percent: ${stock.changePercent}');
    print('updatedat: ${stock.updatedAt}');

    return stock;
  }
}
