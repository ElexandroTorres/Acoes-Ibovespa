class Stock {
  late String symbol;
  late String name;
  late String companyName;
  late String description;
  late double marketCap;
  late double price;
  late String updatedAt;

  Stock(
      {required this.symbol,
      required this.name,
      required this.companyName,
      required this.description,
      required this.marketCap,
      required this.price,
      required this.updatedAt});
}
