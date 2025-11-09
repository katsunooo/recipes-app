import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_for_sweets_app/components/sweets_tile.dart';
import 'package:recipes_for_sweets_app/design/color.dart';
import 'package:recipes_for_sweets_app/data/favorite.dart';
import 'package:recipes_for_sweets_app/data/sweets.dart';
import 'package:recipes_for_sweets_app/pages/recipes_view_page.dart';

class AllRecipesPage extends StatefulWidget {
  const AllRecipesPage({super.key});

  @override
  State<AllRecipesPage> createState() => _AllRecipesPageState();
}

class _AllRecipesPageState extends State<AllRecipesPage> {
  // то, что поиск
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  // провайде и база
  // синхруем на входе
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<Favorite>(context, listen: false).syncToFavorite();
  }

  // добавление в свои рецепты
  void addSweetToFavorite(Sweets sweet) {
    Provider.of<Favorite>(context, listen: false).addToFav(sweet);
  }

  // удаление на этой странице
  void remoteSweetToFavorite(Sweets sweet) {
    Provider.of<Favorite>(context, listen: false).removeFromFav(sweet);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Favorite>(
      builder: (context, value, child) {
        final allSweets = Provider.of<Favorite>(
          context,
          listen: false,
        ).sweetRecipes;

        final filteredSweets = allSweets.where((sweet) {
          return sweet.name.toLowerCase().contains(searchQuery.toLowerCase());
        }).toList();
        return Column(
          children: [
            //-------------- поиск
            Row(
              children: [
                Container(
                  width: 290,
                  margin: EdgeInsets.fromLTRB(20, 20, 10, 30),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(30),
                    border: BoxBorder.all(color: primaryColor),
                  ),
                  child: TextField(
                    controller: searchController,
                    cursorColor: primaryColor,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      hintText: '...Поиск по названию',
                      hintStyle: TextStyle(color: secondColor, fontSize: 15),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 20,
                      ),
                      suffixIcon: searchQuery.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  searchController.clear();
                                  searchQuery = "";
                                });
                              },
                              icon: Icon(Icons.clear, color: primaryColor),
                            )
                          : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: 16),
              ],
            ),
            Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(color: whiteColor),
              alignment: Alignment.center,
              child: Text('здесь категории в будущем'),
              // здесь категории
            ),

            //------------- списки
            Expanded(
              child: filteredSweets.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/unluck.jpg',
                            height: 150,
                            width: 150,
                          ),
                          Text('анлак'),
                          Text('торт не найден'),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredSweets.length,
                      itemBuilder: (context, index) {
                        Sweets sweet = filteredSweets[index];
                        return SweetsTile(
                          sweet: sweet,
                          onTap: () {
                            if (sweet.toFavorites) {
                              remoteSweetToFavorite(sweet);
                            } else {
                              addSweetToFavorite(sweet);
                            }
                          },
                          onOpen: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    RecipesViewPage(sweet: sweet),
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
    );
  }
}
