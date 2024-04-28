import 'package:shop_task/model/categories_model.dart';

import 'api_const.dart';
import 'package:shop_task/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class AppData {
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];

  Future<List<ProductModel>> fetchProducts() async {
    try {
      var request = await http.get(Uri.parse(TheApi().pathForProducts));
      if (request.statusCode == 200) {
        var data = convert.jsonDecode(request.body) as Map<String, dynamic>;
        var whatIWant = data['data']['products'];

        for (var element in whatIWant) {
          products.add(ProductModel.fromJson(element));
        }

        return products;
      } else {
        throw Exception('API request failed with status code: What the hell');
      }
    } on Exception catch (e) {
      // Handle network exceptions, invalid JSON, etc.
      // ignore: avoid_print
      print('Error fetching data: $e');
      rethrow; // Re-throw for further handling in the calling code
    }
  }

  Future<List<CategoryModel>> fetchCategories() async {
    try {
      var request = await http.get(Uri.parse(TheApi().pathForCategories));
      if (request.statusCode == 200) {
        var data = convert.jsonDecode(request.body) as Map<String, dynamic>;
        var whatIWant = data['data']['data'];

        for (var element in whatIWant) {
          categories.add(CategoryModel.fromJson(element));
        }

        return categories;
      } else {
        throw Exception('API request failed with status code: What the hell');
      }
    } on Exception catch (e) {
      // Handle network exceptions, invalid JSON, etc.
      // ignore: avoid_print
      print('Error fetching data: $e');
      rethrow; // Re-throw for further handling in the calling code
    }
  }

  List<String> banners() {
    return [
      "https://student.valuxapps.com/storage/uploads/banners/1689106904Mzsmc.photo_2023-07-11_23-08-24.png",
      "https://student.valuxapps.com/storage/uploads/banners/1689106848R4Nxl.photo_2023-07-11_23-08-19.png",
      "https://student.valuxapps.com/storage/uploads/banners/1689106932hsRxm.photo_2023-07-11_23-07-53.png",
      "https://student.valuxapps.com/storage/uploads/banners/1689110348KHwtl.sales-abstract-landing-page-with-photo_52683-28304 (1) (2).png",
      "https://student.valuxapps.com/storage/uploads/banners/1689108526i90RV.online-shopping-banner-template_23-2148764566 (1).png",
      "https://student.valuxapps.com/storage/uploads/banners/1689108648Avc1g.banner-template-with-summer-sale_23-2148515754 (1).png",
      "https://student.valuxapps.com/storage/uploads/banners/1689107104Ezc0d.photo_2023-07-11_23-07-59.png",
      "https://student.valuxapps.com/storage/uploads/banners/1689106762vIpcq.photo_2023-07-11_23-07-38.png",
      "https://student.valuxapps.com/storage/uploads/banners/1689106805161JH.photo_2023-07-11_23-07-43.png",
      "https://student.valuxapps.com/storage/uploads/banners/1689108280StVEo.cyber-monday-banner-template_23-2148748266 (1).png",
    ];
  }
}
