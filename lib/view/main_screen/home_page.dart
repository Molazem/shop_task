import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shop_task/controller/handle_online_data.dart';
import 'package:shop_task/controller/products_controller.dart';
import 'package:shop_task/model/categories_model.dart';
import 'package:shop_task/model/product_model.dart';
import 'package:shop_task/view/main_screen/custom_widgets/category_widget.dart';
import 'package:shop_task/view/main_screen/custom_widgets/porduct_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductModel> myProducts = [];
  List<CategoryModel> theCategories = [];
  List<String> bannerList = [];
  void _getDate() async {
    myProducts = (await AppData().fetchProducts());
    theCategories = (await AppData().fetchCategories());
    bannerList = AppData().banners();
    setState(() {});
  }

  @override
  void initState() {
    _getDate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentProvider = Provider.of<ProductData>(context);
    currentProvider.setProduct(myProducts);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The Carousel
          SizedBox(
            height: 250,
            child: CarouselSlider(
                enableAutoSlider: true,
                unlimitedMode: true,
                children: List<Widget>.generate(
                    bannerList.length,
                    (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            bannerList[index],
                            fit: BoxFit.cover,
                          ),
                        ))),
          ),
          // Categories
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25),
            child: Text('Categories',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal,
                    fontSize: 22)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: SizedBox(
              height: 120,
              child: (theCategories.isNotEmpty)
                  ? ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 100,
                          child: CategoryCard(
                              currentCategory: theCategories[index]),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: theCategories.length)
                  : const Center(child: CircularProgressIndicator()),
            ),
          ),
          // Products
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
            child: Text('Products',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.normal,
                    fontSize: 22)),
          ),
          SizedBox(
              height: ((myProducts.length / 2)) * 300,
              child: (myProducts.isNotEmpty)
                  ? GridView.builder(
                      itemCount: myProducts.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.75,
                              crossAxisCount: 2,
                              mainAxisExtent: 300),
                      itemBuilder: (context, index) {
                        return ProductCard(
                            product: currentProvider.myProducts[index]);
                      },
                    )
                  : const Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}
