import 'dart:convert';


FruitModel fruitModelFromJson(String str) => FruitModel.fromJson(json.decode(str));

String fruitModelToJson(FruitModel data) => json.encode(data.toJson());

class FruitModel {
  FruitModel(
      {required this.name,
      required this.image,
      required this.description,
      required this.price});
  String name;
  String image;
  String description;
  int price;

  factory FruitModel.fromJson(Map<String, dynamic> data) {

    final String name = data['name'];
    final String image = data['image'];
    final String description = data['description'];
    final int price = data['price'];



    return FruitModel(
        name: name,
    image: image,
    description: description,
    price: price);
  }


  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "description": description,
    "price": price
  };

  @override
  String toString() {
    return 'FruitModel{name: $name, image: $image, description: $description, price: $price}';
  }
}
