import 'package:hive/hive.dart';

part 'stock.g.dart';

@HiveType(typeId: 0)
class Stock {
  @HiveField(0)
  String name;

  @HiveField(1)
  double price;

  @HiveField(2)
  bool isFavorite;

  Stock({required this.name, required this.price, this.isFavorite = false});
}
