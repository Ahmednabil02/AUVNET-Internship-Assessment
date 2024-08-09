import '../../home/data/models/ProductModel.dart';

class Order {
  final List<Data> products;
  final double totalPrice;
  final DateTime orderDate;

  Order({
    required this.products,
    required this.totalPrice,
    required this.orderDate,
  });
}
