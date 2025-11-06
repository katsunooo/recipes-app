import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes_for_sweets_app/design/color.dart';
import 'package:recipes_for_sweets_app/data/favorite.dart';
import 'package:recipes_for_sweets_app/data/sweets.dart';

// ignore: must_be_immutable
class FavoriteTile extends StatefulWidget {
  Sweets sweet;
  FavoriteTile({super.key, required this.sweet});

  @override
  State<FavoriteTile> createState() => _FavoriteTileState();
}

class _FavoriteTileState extends State<FavoriteTile> {
  void removeItemFavorite() {
    Provider.of<Favorite>(context, listen: false).removeFromFav(widget.sweet);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Stack(
        alignment: AlignmentGeometry.topRight,
        children: [
          Container(
            width: 200,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 34),
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
                        height: 55,
                        width: 155,
                        child: Center(
                          child: Text(
                            widget.sweet.name,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 22,
                              height: 1.1,
                              color: primaryColor,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 145,
                        child: Text(
                          widget.sweet.description,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
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
