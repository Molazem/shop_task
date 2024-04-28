import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_task/controller/products_controller.dart';
import 'package:shop_task/view/boarding_page/the_boarding_page.dart';

void main() {
  runApp(ChangeNotifierProvider<ProductData>(
      create: (context) => ProductData(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const BoardingPage(),
    );
  }
}
