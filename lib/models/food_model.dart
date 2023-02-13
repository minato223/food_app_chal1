class FoodModel {
  int id;
  String name;
  String? description;
  String image;
  double price;
  double promotionPrice;
  FoodModel(
      {required this.id,
      required this.name,
      required this.image,
      this.description,
      required this.price,
      required this.promotionPrice});
}
