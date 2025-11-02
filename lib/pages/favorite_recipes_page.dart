import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_for_sweets_app/components/favorite_tile.dart';
import 'package:recipes_for_sweets_app/favorite.dart';
import 'package:recipes_for_sweets_app/sweets.dart';

class FavoriteRecipesPage extends StatefulWidget {
  const FavoriteRecipesPage({super.key});

  @override
  State<FavoriteRecipesPage> createState() => _FavoriteRecipesPageState();
}

class _FavoriteRecipesPageState extends State<FavoriteRecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Favorite>(
      builder: (context, value, child) {
        return Column(
          children: [
            Center(child: Text('Сохраненные рецептики')),
            SizedBox(height: 5),
            Expanded(
              child: GridView.builder(
                itemCount: value.getUserFavorite().length,
                
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  
                  crossAxisCount: 2,
                  mainAxisExtent: 340
                ),
                itemBuilder: (context, index) {
                  Sweets individualSweet = value.getUserFavorite()[index];
                  return FavoriteTile(sweet: individualSweet);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
