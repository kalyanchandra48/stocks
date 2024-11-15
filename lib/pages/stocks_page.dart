



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks/models/stock.dart';
import 'package:stocks/controller/stock_controller.dart';
import 'package:stocks/pages/favourite_stocks.dart';
class StocksPage  extends StatelessWidget{
  final StockController stockController = Get.put(StockController());

  final Box<Stock> stockBox = Hive.box<Stock>('stocks');

  @override


  
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Stocks'),

      ),
    floatingActionButton: FloatingActionButton(onPressed: (){
      Get.to(()=>FavoritesPage());

    },
    child: Icon(Icons.favorite)
    
    ),
      body:Obx(() {
        return ListView.builder(
          itemCount: stockController.stocks.length,
          itemBuilder: (context, index) {
            var stock = stockController.stocks[index];
            return ListTile(
              title: Text(stock.name),
              subtitle: Text('\$${stock.price.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(
                  stock.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: stock.isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () {
                  stockController.toggleFavorite(index);
                },
              ),
            );
          },
        );
      }),
      
      
      
      // ValueListenableBuilder(
      //   valueListenable: stockBox.listenable(),
      //   builder: (context, Box<Stock> box, _) {
      //     var stocks = box.values.toList();

      //     if (stocks.isEmpty) {
      //       return Center(child: Text("No stocks available"));
      //     }

      //     return ListView.builder(
      //       itemCount: stocks.length,
      //       itemBuilder: (context, index) {
      //         var stock = stocks[index];

      //         return ListTile(
      //           title: Text(stock.name),
      //           subtitle: Text('\$${stock.price.toStringAsFixed(2)}'),
      //           trailing: IconButton(
      //             icon: Icon(
      //               stock.isFavorite ? Icons.favorite : Icons.favorite_border,
      //               color: stock.isFavorite ? Colors.red : Colors.grey,
      //             ),
      //             onPressed: () {
      //               // Toggle favorite status
      //               stock.isFavorite = !stock.isFavorite;

      //               stockController.toggleFavorite(index);
      //            // Save the change to Hive
      //             },
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    

    );
  }
}