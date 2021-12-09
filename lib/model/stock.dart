class Stock {
  String? symbol;
  String? name;
  String? companyName;
  String? description;
  double? marketCap;
  double? price;
  double? changePercent;
  String? updatedAt;

  Stock(
      {this.symbol,
      this.name,
      this.companyName,
      this.description,
      this.marketCap,
      this.price,
      this.changePercent,
      this.updatedAt});

  Stock.fromJson(Map<String, dynamic> json)
      : symbol = json['symbol'],
        name = json['name'],
        companyName = json['company_name'],
        description = json['description'],
        marketCap = json['market_cap'],
        price = json['price'],
        changePercent = json['change_percent'],
        updatedAt = json['updated_at'];

  Stock.noData()
      : symbol = 'Simbolo invalido',
        name = 'Nenhnuma compania correspondente ao simbolo informado',
        companyName = 'Companina invalida',
        description = '',
        marketCap = 0,
        price = 0,
        changePercent = 0,
        updatedAt = '';
}
