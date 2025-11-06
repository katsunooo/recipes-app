import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:recipes_for_sweets_app/data/favorite.dart';
import 'package:recipes_for_sweets_app/data/sweets.dart';
import 'package:recipes_for_sweets_app/pages/favorite_recipes_page.dart';
import 'package:recipes_for_sweets_app/pages/home_page.dart';
import 'package:recipes_for_sweets_app/pages/welcome_page.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SweetsAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Favorite(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (context) => const HomePage(),
          '/fav': (context) => const FavoriteRecipesPage(),
        },
        home: const WelcomePage(),
      ),
    );
  }
}
