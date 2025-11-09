import 'package:flutter/material.dart';
import 'package:flutter_close_app/flutter_close_app.dart';
import 'package:recipes_for_sweets_app/design/color.dart';
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

  final List<Widget> _pages = [AllRecipesPage(), FavoriteRecipesPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: bgColor,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Container(
              //padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(Icons.menu_outlined, color: whiteColor),
              ),
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: whiteColor,
        selectedItemColor: primaryColor,
        unselectedItemColor: secondColor,
        currentIndex: _selectedIndex,
        onTap: navigateBottomBar,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "все рецепты",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "сохраненные",
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 20),
                Container(
                  width: 160,
                  height: 180,
                  child: Image.asset(
                    'assets/icon-cake.png',
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(color: whiteColor),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: GestureDetector(
                    child: ListTile(
                      leading: Icon(Icons.favorite, color: whiteColor),
                      title: Text(
                        'Сoхраненные',
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/fav');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.add, color: whiteColor),
                    title: Text('Создать', style: TextStyle(color: whiteColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.settings, color: whiteColor),
                    title: Text(
                      'Настройки',
                      style: TextStyle(color: whiteColor),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(Icons.info_outline, color: whiteColor),
                    title: Text('О нас', style: TextStyle(color: whiteColor)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 50),
              child: ListTile(
                leading: Icon(Icons.exit_to_app, color: whiteColor),
                title: GestureDetector(
                  child: Text('Выход', style: TextStyle(color: whiteColor)),
                  onTap: () => FlutterCloseApp.close(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
