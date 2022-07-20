
class ProductModel {
  ProductModel({
    this.image,
    this.categoryId,
    this.rate,
    this.price,
    this.name,
    this.discount,
    this.ingredients,
    this.description,
    this.time,
    this.serving,
    this.id,
  });

  String image;
  String categoryId;
  int rate;
  int price;
  String name;
  int discount;
  List<String> ingredients;
  String description;
  int time;
  int serving;
  String id;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    image: json["image"],
    categoryId: json["category_id"],
    rate: json["rate"],
    price: json["price"],
    name: json["name"],
    discount: json["discount"],
    ingredients: List<String>.from(json["ingredients"].map((x) => x)),
    description: json["description"],
    time: json["time"],
    serving: json["serving"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "category_id": categoryId,
    "rate": rate,
    "price": price,
    "name": name,
    "discount": discount,
    "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
    "description": description,
    "time": time,
    "serving": serving,
    "id": id,
  };
}
