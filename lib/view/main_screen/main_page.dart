import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'categories_page.dart';
import 'favourites_page.dart';
import 'home_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // Use underscore for private state variables

  void _onChangeIndex(int index) {
    setState(() {
      _currentIndex = index; // Use underscore for private state variables
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = const [
      // Replace with your actual page widgets
      HomePage(), // Example: Replace with your Home page widget
      CategoriesPage(), // Example: Replace with your Categories page widget
      FavouritesPage(), // Example: Replace with your Favourites page widget
      SettingsPage(), // Example: Replace with your Settings page widget
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop App',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.black38,
        showUnselectedLabels: true, // Display labels for all items
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: _onChangeIndex,
      ),
    );
  }
}
