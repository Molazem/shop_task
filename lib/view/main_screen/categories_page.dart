import 'package:flutter/material.dart';
import 'package:shop_task/controller/handle_online_data.dart';
import 'package:shop_task/model/categories_model.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  List<CategoryModel> theCategories = [];

  void getTMFCategories() async {
    theCategories = await AppData().fetchCategories();
    setState(() {});
  }

  @override
  void initState() {
    getTMFCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: theCategories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 25.0),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black38))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.navigate_before),
                  iconSize: 32,
                ),
                const Spacer(),
                Text(
                  theCategories[index].name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 85,
                  child: Image.network(theCategories[index].image),
                ),
              ],
            ),
          );
        });
  }
}
