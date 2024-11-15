import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:stocks/controller/stock_controller.dart';
import 'package:stocks/models/stock.dart';

import 'package:stocks/pages/stocks_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and Hive Flutter
  await Hive.initFlutter();

  // Register the adapter for the Stock model
  Hive.registerAdapter(StockAdapter());

  // Open the 'stocks' box
  
  stockBox=await Hive.openBox<Stock>('stocks');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: StocksPage(),
    );
  }
}

