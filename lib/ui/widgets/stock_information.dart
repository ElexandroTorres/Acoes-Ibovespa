import 'package:acoes_ibovespa/model/stock.dart';
import 'package:flutter/material.dart';

class StockInformation extends StatelessWidget {
  final Stock stockData;

  const StockInformation({Key? key, required this.stockData}) : super(key: key);

  String get companyName {
    if (stockData.companyName == null) {
      return stockData.name.toString();
    }
    return stockData.companyName.toString();
  }

  Container get descriptionContainer {
    if (stockData.description == null) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      child: Text(
        stockData.description.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
        ),
      ),
    );
  }

  Color get changePercentColor {
    if (stockData.changePercent! >= 0) {
      return Colors.green;
    }
    return Colors.red;
  }

  IconData get changePercentIcon {
    if (stockData.changePercent! >= 0) {
      return Icons.arrow_upward_outlined;
    }
    return Icons.arrow_downward_outlined;
  }

  Container get stockInfosContainer {
    if (stockData.price == null || stockData.changePercent == null) {
      return Container(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Sem informações sobre essa ação!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'R\$ ${stockData.price}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                changePercentIcon,
                color: changePercentColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '${stockData.changePercent}%',
                style: TextStyle(
                  color: changePercentColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                changePercentIcon,
                color: changePercentColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container get updateTimeInfo {
    if (stockData.updatedAt == null) {
      return Container();
    }
    return Container(
      padding: EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(
            'Ultima atualização as ${DateTime.parse(stockData.updatedAt.toString()).hour}:${DateTime.parse(stockData.updatedAt.toString()).minute} '),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xFFD2D9D8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xFFD2D9D8),
              border: Border.all(color: Color(0xFF072B59)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  stockData.symbol.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  companyName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  child: descriptionContainer,
                ),
              ],
            ),
          ),
          Column(
            children: [
              stockInfosContainer,
              updateTimeInfo,
            ],
          ),
        ],
      ),
    );
  }
}
