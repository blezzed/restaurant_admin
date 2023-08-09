
enum Category {fruits, food, drinks}

class ProductModel {
  int? id;
  String? name;
  String? description;
  double? price;
  double? stars;
  String? img;
  String? createdAt;
  String? updatedAt;
  Category? category;

  ProductModel(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.img,
        this.createdAt,
        this.updatedAt,
        this.category});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = Category.values[json['category']];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "description": this.description,
      "price": this.price,
      "stars": this.stars,
      "img": this.img,
      "createdAt": this.createdAt,
      "updatedAt": this.updatedAt,
      "category": this.category!.index
    };
  }
}
