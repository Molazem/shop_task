import 'package:flutter/foundation.dart';
import 'package:shop_task/model/product_model.dart';

class ProductData extends ChangeNotifier {
  List<ProductModel> myProducts = [];
  List<ProductModel> favouriteProducts = [];
  void setProduct(List<ProductModel> products) {
    myProducts = products;
    notifyListeners();
  }

  bool toggle(bool anyBool) => !anyBool;

  void addToFavourites(ProductModel product) {
    product.isFav = toggle(product.isFav);
    if (product.isFav) favouriteProducts.add(product);
    if (!product.isFav) favouriteProducts.remove(product);
    notifyListeners();
  }
}
