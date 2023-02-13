import 'package:food_app_chal1/constants/app_images.dart';
import 'package:food_app_chal1/models/food_menu_model.dart';
import 'package:food_app_chal1/models/food_model.dart';

class FoodFixtures {
  static List<double> get _prices {
    return [3, 4];
  }

  static List<FoodModel> get foods => [
        FoodModel(
            id: 1,
            image: AppImages.food2,
            name: "Veggie Burger",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 2,
            image: AppImages.food3,
            name: "Eggplant Parmesan",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 3,
            image: AppImages.food4,
            name: "Bean-Centered Dishes",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 4,
            image: AppImages.food5,
            name: "Spring Rolls",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 5,
            image: AppImages.food6,
            name: "Bean-Centered Dishes",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 6,
            image: AppImages.food7,
            name: "Finger Lickin",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 7,
            image: AppImages.food8,
            name: "Chicken",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 8,
            image: AppImages.food9,
            name: "Turkey All Year",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 9,
            image: AppImages.food10,
            name: "Fried chicken drumsticks",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 10,
            image: AppImages.food11,
            name: "Fatty Fowl",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 11,
            image: AppImages.food12,
            name: "Pan-Fried Wild Salmon",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 12,
            image: AppImages.food13,
            name: "Grilled Salmon Sandwich with Dill Sauce",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 13,
            image: AppImages.food2,
            name: "Sea Bass a la Michele",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 14,
            image: AppImages.food3,
            name: "Pan Seared Lemon Tilapia with Parmesan Pasta",
            price: _prices[0],
            promotionPrice: _prices[1]),
        FoodModel(
            id: 14,
            image: AppImages.food6,
            name: "Grilled Tilapia with Mango Salsa,Surf and Turf for Two",
            price: _prices[0],
            promotionPrice: _prices[1]),
      ];

  static List<FoodMenuModel> get foodMenuList => [
        FoodMenuModel(id: 1, name: "French Fries", price: _prices[0]),
        FoodMenuModel(id: 2, name: "Shrimp crisp", price: _prices[0]),
        FoodMenuModel(id: 3, name: "Lalaban", price: _prices[0]),
      ];
}
