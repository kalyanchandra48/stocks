import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks/models/stock.dart';
 late Box<Stock> stockBox;
class StockController extends GetxController {
  var stocks = <Stock>[].obs; // Observable list of stocks
 

  @override
  void onInit() {
    super.onInit();
    loadStocks(); // Load initial stock data
    
  }

  // Initialize Hive box and load stocks
  Future<void> loadStocks() async {
   
      // Dummy data if the box is empty
      stocks.addAll([
        Stock(name: 'AAPL', price: 150.00),
        Stock(name: 'GOOGL', price: 2800.50),
        Stock(name: 'AMZN', price: 3500.75),
        Stock(name: 'MSFT', price: 299.00),      // Microsoft
  Stock(name: 'TSLA', price: 725.00),      // Tesla
  Stock(name: 'NFLX', price: 525.50),      // Netflix
  Stock(name: 'NVDA', price: 195.75),      // Nvidia
  Stock(name: 'FB', price: 325.10),        // Facebook (Meta)
  Stock(name: 'BABA', price: 168.45),      // Alibaba
  Stock(name: 'V', price: 228.30),         // Visa
  Stock(name: 'JPM', price: 155.60),       // JPMorgan Chase
  Stock(name: 'DIS', price: 178.90),       // Disney
  Stock(name: 'ADBE', price: 660.20),      // Adobe
  Stock(name: 'PYPL', price: 240.30),      // PayPal
  Stock(name: 'ORCL', price: 90.80),       // Oracle
  Stock(name: 'UBER', price: 45.70),       // Uber
  Stock(name: 'INTC', price: 52.40),       // Intel
  Stock(name: 'AMD', price: 108.15),       // AMD
  Stock(name: 'SQ', price: 258.20),
      ]);
    
  }

  // Toggle favorite status and save to local storage
  void toggleFavorite(int index) {
    var stock = stocks[index];
    stock.isFavorite = !stock.isFavorite;
    stockBox.put(stock.price.toInt(), stock);
    if(stockBox.containsKey(stock.price.toInt())){
      stockBox.delete(stock.price);
    }
    stocks[index] = stock; 
    update();// Update observable list
  }
    List<Stock> get favoriteStocks => stocks.where((stock) => stock.isFavorite).toList();

}
