import 'package:flutter/cupertino.dart';
import 'package:shop_app/Providers/cart.dart';


class OrderItem {
  final String id;
  final double amount;
  final DateTime dateTime;
  final List<CartItem> products;
  OrderItem(
      {required this.amount,
      required this.dateTime,
      required this.id,
      required this.products});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get order {
    return [..._orders];
  }

  void addOrder(double amount, List<CartItem> cartprod) {
    _orders.insert(
      0,
      OrderItem(
          amount: amount,
          dateTime: DateTime.now(),
          id: DateTime.now().toString(),
          products: cartprod),
    );
    notifyListeners();
  }
  
}
