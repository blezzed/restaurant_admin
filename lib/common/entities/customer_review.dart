class ReviewData{
  int? id;
  String? name;
  String? avatar;
  String? comment;
  String? product_name, product_img;
  double? rating;
  String created_at = DateTime.now().toString();

  ReviewData({
    required this.id, required this.name, this.avatar, required this.comment, required this.product_name, required this.product_img, required this.rating, required this.created_at
  });

  ReviewData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name']!;
    avatar = json['avatar'];
    comment = json['comment'];
    product_name = json['product_name'];
    product_img = json['product_img'];
    rating = json['rating'];
    created_at = json['created_at'];
  }

  Map<String, dynamic> toJson(){
    return {
      "id":this.id,
      "name":this.name,
      "avatar":this.avatar,
      "comment":this.comment,
      "product_name":this.product_name,
      "product_img":this.product_img,
      "rating":this.rating,
      "created_at":this.created_at,
    };
  }
}
