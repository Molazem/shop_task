class ProductModel {
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final String image;
  final String name;
  final String description;
  final List<String> detailsImages;
  bool isFav = false;

  ProductModel(
      {required this.name,
      required this.description,
      required this.image,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.detailsImages,
      this.isFav = false});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      detailsImages:
          json['images'].cast<String>(), // Ensure strings in the list
    );
  }
}
