import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_task/controller/products_controller.dart';
import 'package:shop_task/view/main_screen/custom_widgets/porduct_widget.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductData>(builder: (context, provider, child) {
      return GridView.builder(
        itemCount: provider.favouriteProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 2, crossAxisCount: 1, mainAxisExtent: 300),
        itemBuilder: (context, index) {
          return ProductCard(
            product: provider.favouriteProducts[index],
          );
        },
      );
    });
  }
}
