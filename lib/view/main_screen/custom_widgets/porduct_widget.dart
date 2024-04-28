import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_task/controller/products_controller.dart';
import 'package:shop_task/model/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          border: Border(
              right: BorderSide(color: Colors.black38),
              bottom: BorderSide(color: Colors.black38))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if ((product.discount as int) != 0)
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 6.0),
                  color: Colors.yellow,
                  child: Text('${product.discount}% DISCOUNT'),
                ),
                const Spacer()
              ],
            ),
          SizedBox(height: 150, child: Image.network(product.image)),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  product.price.toString(),
                  style:
                      const TextStyle(color: Colors.indigoAccent, fontSize: 16),
                ),
                const SizedBox(
                  width: 10,
                ),
                if ((product.discount as int) != 0)
                  Text(
                    product.price.toString(),
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                const Spacer(),
                Consumer<ProductData>(builder: (context, provider, child) {
                  return IconButton.filled(
                    onPressed: () => provider.addToFavourites(product),
                    icon: const Icon(Icons.favorite_border),
                    iconSize: 18,
                    style: IconButton.styleFrom(
                        backgroundColor: (product.isFav)
                            ? Colors.indigoAccent
                            : Colors.grey),
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
