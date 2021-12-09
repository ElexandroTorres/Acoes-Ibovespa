import 'dart:convert';
import 'package:acoes_ibovespa/api/hg_finance_api_infos.dart';
import 'package:http/http.dart' as http;
import 'package:acoes_ibovespa/model/stock.dart';

class HGFinanceApi {
  Future<void> makeRequest(String? stockSymbol) async {
    //String request = '$url&symbol=$stockSymbol';
    String request = '$url&symbol=bidi4adasdad';
    Map<String, dynamic> stockData;
    Map<String, dynamic> stockResults;
    Stock stock;

    http.Response response = await http.get(Uri.parse(request));

    stockData = jsonDecode(response.body);
    stockResults = stockData['results'];

    String symbol = stockResults.keys.first;

    // The 'error' is only avaliable when the api returns an invalid symbol json.
    if (stockResults[symbol]['error'] != null) {
      return;
    }

    stock = Stock(
        symbol: symbol,
        name: stockResults[symbol]['name'],
        companyName: stockResults[symbol]['company_name'],
        description: stockResults[symbol]['description'],
        marketCap: stockResults[symbol]['market_cap'],
        price: stockResults[symbol]['price'],
        updatedAt: stockResults[symbol]['updated_at']);
    //return stock;
  }
}
