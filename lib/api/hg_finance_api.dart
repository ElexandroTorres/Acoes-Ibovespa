import 'dart:convert';
import 'package:acoes_ibovespa/api/hg_finance_api_infos.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:acoes_ibovespa/model/stock.dart';

enum ApiCallState { start, loading, success, error }

class HGFinanceApi {
  final state = ValueNotifier<ApiCallState>(ApiCallState.start);
  late http.Response response;

  Future<Stock> makeRequest(String? stockSymbol) async {
    String request = '$url&symbol=$stockSymbol';
    Map<String, dynamic> stockData;
    Map<String, dynamic> stockResults;
    Stock stock;

    state.value = ApiCallState.loading;
    try {
      response = await http.get(Uri.parse(request));
      state.value = ApiCallState.success;
    } catch (e) {
      state.value = ApiCallState.error;
    }

    stockData = jsonDecode(response.body);

    String symbol = stockData['results'].keys.first;

    // The 'error' is only avaliable when the api returns an invalid symbol json.
    if (stockData['results'][symbol]['error'] != null) {
      stock = Stock.noData();
      return stock;
    }

    stockResults = stockData['results'][symbol];
    stock = Stock.fromJson(stockResults);

    return stock;
  }
}
