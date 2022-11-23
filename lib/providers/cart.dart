import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  Map<int, int> _cartList={};
  Map<int, int> get getCart => _cartList;
  bool isExist(int id) {
    return _cartList.keys.contains(id);
  }

  void addItem(int id, int amount) {
    if (isExist(id)) {
      _cartList.update(id, (value) => value + amount);
    } else {
      _cartList[id] = amount;
    }
    notifyListeners();
  }
}
