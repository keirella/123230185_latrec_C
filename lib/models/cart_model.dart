import 'package:hive/hive.dart';

part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartItem extends HiveObject {

  @HiveField(0)
  String username;

  @HiveField(1)
  int id;

  @HiveField(2)
  String title;

  @HiveField(3)
  double price;

  @HiveField(4)
  String thumbnail;

  @HiveField(5)
  int qty;

  @HiveField(6)
  int stock;

  CartItem({
    required this.username,
    required this.id,
    required this.title,
    required this.price,
    required this.thumbnail,
    required this.qty,
    required this.stock,
  });
}