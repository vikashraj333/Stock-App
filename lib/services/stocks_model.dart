class Stock {
  final String symbol;
  final String companyName;
  final double price;
  final double change;
  final double percentageChange;
  final double marketCap;
  final String sector;
  final int volume;
  final double open;
  final double high;
  final double low;
  final double previousClose;
  final double peRatio;
  final double dividendYield;
  final DateTime timestamp;

  Stock({
    required this.symbol,
    required this.companyName,
    required this.price,
    required this.change,
    required this.percentageChange,
    required this.marketCap,
    required this.sector,
    required this.volume,
    required this.open,
    required this.high,
    required this.low,
    required this.previousClose,
    required this.peRatio,
    required this.dividendYield,
    required this.timestamp,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json['symbol'],
      companyName: json['companyName'],
      price: json['price'].toDouble(),
      change: json['change'].toDouble(),
      percentageChange: json['percentageChange'].toDouble(),
      marketCap: json['marketCap'].toDouble(),
      sector: json['sector'],
      volume: json['volume'],
      open: json['open'].toDouble(),
      high: json['high'].toDouble(),
      low: json['low'].toDouble(),
      previousClose: json['previousClose'].toDouble(),
      peRatio: json['peRatio'].toDouble(),
      dividendYield: json['dividendYield'].toDouble(),
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}