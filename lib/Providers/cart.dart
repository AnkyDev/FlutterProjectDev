import 'package:flutter/material.dart';

class CartItem {
  final String prodId;
  final String tital;
  final double price;
  final int quantity;
  CartItem({
    required this.prodId,
    required this.price,
    required this.quantity,
    required this.tital,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  String get itemCount {
    return _items.length.toString();
  }

  double get totalSum {
    var totalVal = 0.0;
    _items.forEach(
      (key, value) {
        totalVal += value.price * value.quantity;
      },
    );
    return totalVal;
  }

  void addItem(String id, String tital, double price) {
    if (items.containsKey(id)) {
      _items.update(
        id,
        (existingValue) => CartItem(
          prodId: existingValue.prodId,
          price: existingValue.price,
          quantity: existingValue.quantity + 1,
          tital: existingValue.tital,
        ),
      );
    } else {
      _items.putIfAbsent(
        id,
        () => CartItem(
            prodId: DateTime.now().toString(),
            price: price,
            quantity: 1,
            tital: tital),
      );
    }
    notifyListeners();
  }

  void removeSingleItem(String prodId) {
    if (!_items.containsKey(prodId)) {
      return;
    }
    if (_items[prodId]!.quantity > 1) {
      _items.update(
          prodId,
          (value) => CartItem(
              prodId: value.prodId,
              price: value.price,
              quantity: value.quantity - 1,
              tital: value.tital));
    } else {
      _items.remove(prodId);
    }
  }

  void removeItem(String prodId) {
    _items.remove(prodId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
