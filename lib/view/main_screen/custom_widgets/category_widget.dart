import 'package:flutter/material.dart';
import 'package:shop_task/model/categories_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel currentCategory;
  const CategoryCard({super.key, required this.currentCategory});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        children: [
          Image.network(
            currentCategory.image,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              const Spacer(),
              Container(
                width: double.maxFinite,
                color: Colors.grey,
                child: Text(
                  currentCategory.name,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
