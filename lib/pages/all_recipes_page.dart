import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_for_sweets_app/components/sweets_tile.dart';
import 'package:recipes_for_sweets_app/favorite.dart';
import 'package:recipes_for_sweets_app/sweets.dart';

class AllRecipesPage extends StatefulWidget {
  const AllRecipesPage({super.key});

  @override
  State<AllRecipesPage> createState() => _AllRecipesPageState();
}

class _AllRecipesPageState extends State<AllRecipesPage> {
  // добавление в свои рецепты
  void addSweetToFavorite(Sweets sweet) {
    sweet.toFavorites = true;
    Provider.of<Favorite>(context, listen: false).addItemToFavorite(sweet);
  }
  // удаление на этой странице
  void remoteSweetToFavorite(Sweets sweet) {
    sweet.toFavorites = false;
    Provider.of<Favorite>(context, listen: false).remoteItemFavorite(sweet);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Favorite>(
      builder: (context, value, child) => Column(
        children: [
          Container(child: Text('поиск в разработке')),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                Sweets sweet = value.getSweetsList()[index];
                return SweetsTile(
                  sweet: sweet,
                  onTap: () {
                    if (sweet.toFavorites == false) {
                      addSweetToFavorite(sweet);
                    } else {
                      remoteSweetToFavorite(sweet);
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
