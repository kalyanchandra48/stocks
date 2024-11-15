


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks/controller/stock_controller.dart';
import 'package:stocks/models/stock.dart';

class FavoritesPage extends StatelessWidget {
  final StockController stockController = Get.find<StockController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorite Stocks')),
      body: ValueListenableBuilder(
  valueListenable: Hive.box<Stock>('stocks').listenable(),
  builder: (context, Box<Stock> box, _) {
    var stocks = box.values.toList();
    if (stocks.isEmpty) {
      return Center(child: Text("No stocks available"));
    }
    return ListView.builder(
      itemCount: stocks.length,
      itemBuilder: (context, index) {
        var stock = stocks[index];
        return ListTile(
          title: Text(stock.name),
          subtitle: Text('\$${stock.price.toStringAsFixed(2)}'),
        );
      },
    );
  },
),

    );
  }
}
