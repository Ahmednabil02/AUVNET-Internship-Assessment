class ProductModel {
  bool? status;
  ProductItem? data;

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new ProductItem.fromJson(json['data']) : null;
  }
}
class ProductItem {
  List<Data> productList = [];

  ProductItem.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        productList.add( new Data.fromJson(v));
      });
    }
  }
}
class Data {
  late int id;
  late final price;
  late final oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;
  late bool inFavorites;
  late bool inCart;
  List<String> images = [];

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
    images = json['images'].cast<String>();
  }

}
