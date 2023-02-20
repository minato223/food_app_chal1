import 'package:flutter/material.dart';
import 'package:food_app_chal1/models/cart_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartModel> _list = [];
  List<CartModel> get getCartList => _list;
  void addToCart(CartModel model) {
    if (!_list.map((e) => e.food.image).toList().contains(model.food.name)) {
      _list.add(model);
    } else {
      _list.insert(_list.indexOf(model), model);
    }
    notifyListeners();
  }

  void removeFromCart(CartModel model) {
    if (!_list.indexOf(model).isNegative) {
      _list.removeAt(_list.indexOf(model));
    }
    notifyListeners();
  }
}
