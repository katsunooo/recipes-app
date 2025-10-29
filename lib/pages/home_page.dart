import 'package:flutter/material.dart';
import 'package:recipes_for_sweets_app/pages/all_recipes_page.dart';
import 'package:recipes_for_sweets_app/pages/favorite_recipes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    AllRecipesPage(),
    FavoriteRecipesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu_outlined, color: Colors.pink),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink[500],
        unselectedItemColor: Colors.pink[200],
        currentIndex: _selectedIndex,
        onTap: navigateBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cake_outlined),
            label: "все рецепты",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "сохраненные",
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.pink[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(child: Image.asset('assets/icon-cake.png', color: Colors.white,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(color: Colors.white),
                ),
            
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(leading: Icon(Icons.home_outlined), title: Text('home')),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(leading: Icon(Icons.info_outline), title: Text('about')),
                ),
              ],
            ),
            Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(leading: Icon(Icons.exit_to_app_outlined), title: Text('exit')),
                ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
