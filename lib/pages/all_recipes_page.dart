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
          Container(
            margin: EdgeInsets.fromLTRB(20, 20, 10, 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: BoxBorder.all(color: Colors.pinkAccent),
              ),
            child: TextField(
              controller: searchController,
              cursorColor: Colors.pink,
              style: TextStyle(
                color: Colors.pink, fontSize: 18
              ),
              decoration: InputDecoration(
                hintText: 'Введите название тортика',
                  hintStyle: TextStyle(color: Colors.pink[300], fontSize: 15),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 20,
                  ),
                  suffixIcon: searchQuery.isNotEmpty
                  ? IconButton(onPressed: (){
                    setState(() {
                      searchController.clear();
                      searchQuery ="";
                    });
                  }, icon: Icon(Icons.clear, color: Colors.pink),
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

          SizedBox(height: 5),

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
