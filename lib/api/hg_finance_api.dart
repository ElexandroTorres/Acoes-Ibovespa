import 'package:acoes_ibovespa/api/hg_finance_api_infos.dart';
import 'package:http/http.dart' as http;

class HGFinanceApi {
  void makeRequest(String stock) async {
    String request = '$url&symbol=$stock';
    http.Response response = await http.get(Uri.parse(request));
    print(response.body);
  }
}
