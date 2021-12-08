class Stock {
  String symbol;
  String name;
  String companyName;
  String description;
  double marketCap;
  double price;
  String updatedAt;

  Stock(
      {this.symbol = '',
      this.name = '',
      this.companyName = '',
      this.description = '',
      this.marketCap = 0,
      this.price = 0,
      this.updatedAt = ''});
}
