import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_for_sweets_app/favorite.dart';
import 'package:recipes_for_sweets_app/sweets.dart';

class FavoriteTile extends StatefulWidget {
  Sweets sweet;
  FavoriteTile({super.key, required this.sweet});

  @override
  State<FavoriteTile> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {

  void removeItemFavorite(){
    widget.sweet.toFavorites = false;
    Provider.of<Favorite>(context, listen: false).remoteItemFavorite(widget.sweet);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Image.asset(widget.sweet.imageSweet, height: 50, width: 50,),
        title: Text(widget.sweet.name),
        subtitle: Text(widget.sweet.description),
        trailing: IconButton(onPressed: removeItemFavorite, icon: Icon(Icons.dangerous_outlined)),
      ),
    );
  }
}