import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_for_sweets_app/components/sweets_tile.dart';
import 'package:recipes_for_sweets_app/design/color.dart';
import 'package:recipes_for_sweets_app/favorite.dart';
import 'package:recipes_for_sweets_app/sweets.dart';

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
  void dispose(){
    searchController.dispose();
    super.dispose();
  }

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
      builder: (context, value, child) {
        final allSweets = Provider.of<Favorite>(context, listen: false).getSweetsList();

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
                    color: primaryColor, fontSize: 18, fontWeight: FontWeight.w600
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
                      ? IconButton(onPressed: (){
                        setState(() {
                          searchController.clear();
                          searchQuery ="";
                        });
                      }, icon: Icon(Icons.clear, color: primaryColor),
                      )
                      : null,
                  ),
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                    });
                  },
                )
              ),
              SizedBox(width: 20,)
            ],
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: whiteColor
            ),
            // здесь категории
          ),

          //------------- списки

          Expanded(
            child: 
               filteredSweets.isEmpty
                ?Center(
                  child: Column(
                    children:[
                      Image.asset('assets/unluck.jpg', height: 150, width: 150,),
                      Text('анлак'),
                      Text('торт не найден'),
                    ]
                  )
                )
             :
            ListView.builder(
              itemCount: filteredSweets.length,
              itemBuilder: (context, index) {
                Sweets sweet = filteredSweets[index];
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
      );
  }
    );
  }
}
