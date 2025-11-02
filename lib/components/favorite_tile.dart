import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_for_sweets_app/design/color.dart';
import 'package:recipes_for_sweets_app/favorite.dart';
import 'package:recipes_for_sweets_app/sweets.dart';

class FavoriteTile extends StatefulWidget {
  Sweets sweet;
  FavoriteTile({super.key, required this.sweet});

  @override
  State<FavoriteTile> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  void removeItemFavorite() {
    widget.sweet.toFavorites = false;
    Provider.of<Favorite>(
      context,
      listen: false,
    ).remoteItemFavorite(widget.sweet);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        alignment: AlignmentGeometry.topRight,
        children: [
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        alignment: AlignmentGeometry.center,
                        children: [
                          Container(
                            height: 145,
                            width: 145,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(16),
                            child: Image.asset(
                              widget.sweet.imageSweet,
                              width: 128,
                              height: 128,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 175,
                        child: Center(
                          child: Text(
                            widget.sweet.name,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 22,
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 145,
                        child: Text(
                          widget.sweet.description,
                          maxLines: 4,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
          ),
          Container(
            height: 35,
            width: 35,

            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(30),
            ),

            child: Center(
              child: IconButton(
                onPressed: removeItemFavorite,
                icon: Icon(Icons.close, color: whiteColor, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
