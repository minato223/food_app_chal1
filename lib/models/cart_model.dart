import 'package:food_app_chal1/models/food_menu_model.dart';
import 'package:food_app_chal1/models/food_model.dart';

class CartModel {
  int? id;
  FoodModel food;
  int quantity;
  List<FoodMenuModel>? menus;
  CartModel({required this.food, required this.quantity, this.id, this.menus});
}
