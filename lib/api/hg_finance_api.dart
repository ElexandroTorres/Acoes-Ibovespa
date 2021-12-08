import 'dart:convert';
import 'package:acoes_ibovespa/api/hg_finance_api_infos.dart';
import 'package:http/http.dart' as http;
import 'package:acoes_ibovespa/model/stock.dart';

class HGFinanceApi {
  Future<Stock> makeRequest(String? stockSymbol) async {
    String request = '$url&symbol=$stockSymbol';
    //Map stockData = {};
    late Stock stock;

    http.Response response = await http.get(Uri.parse(request));
    print('chegou aki');
    print('codigo de status: ${response.statusCode}');
    //print(response.body);

    List<dynamic> stockData = jsonDecode(response.body) as List<dynamic>;
    stock = Stock(
        companyName: 'a',
        symbol: 'a',
        updatedAt: 'a',
        description: 'a',
        name: 'a',
        price: 0,
        marketCap: 0);

    print(stockData);
    /*
    stock = Stock(
        symbol: stockData['results'][0]['symbol'],
        name: stockData['results'][stockSymbol.toString().toUpperCase()]
            ['name'],
        companyName: stockData['results'][stockSymbol.toString().toUpperCase()]
            ['company_name'],
        description: stockData['results'][stockSymbol.toString().toUpperCase()]
            ['description'],
        marketCap: stockData['results'][stockSymbol.toString().toUpperCase()]
            ['market_cap'],
        price: stockData['results'][stockSymbol.toString().toUpperCase()]
            ['price'],
        updatedAt: stockData['results'][stockSymbol.toString().toUpperCase()]
            ['updated_at']);

    */
    return stock;
  }
}
