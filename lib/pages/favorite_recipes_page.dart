import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_for_sweets_app/components/favorite_tile.dart';
import 'package:recipes_for_sweets_app/data/favorite.dart';
import 'package:recipes_for_sweets_app/data/sweets.dart';
import 'package:recipes_for_sweets_app/design/color.dart';
import 'package:recipes_for_sweets_app/pages/recipes_view_page.dart';

class FavoriteRecipesPage extends StatefulWidget {
  const FavoriteRecipesPage({super.key});

  @override
  State<FavoriteRecipesPage> createState() => _FavoriteRecipesPageState();
}

class _FavoriteRecipesPageState extends State<FavoriteRecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: bgColor,
        title: Text(
          'Сохраненные рецептики',
          style: TextStyle(
            color: primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Consumer<Favorite>(
        builder: (context, value, child) {
          final favorites = value.userFavorite;

          if (favorites.isEmpty) {
            return Center(
              child: Text(
                'Нет сохраненных\nрецептов',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 26,
                  color: secondColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          }

          return Column(
            children: [
              SizedBox(height: 10),
              Expanded(
                child: GridView.builder(
                  itemCount: favorites.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 340,
                  ),
                  itemBuilder: (context, index) {
                    Sweets mySweet = favorites[index];
                    return FavoriteTile(
                      sweet: mySweet,
                      onOpen: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RecipesViewPage(sweet: mySweet),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
