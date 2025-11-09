import 'package:flutter/material.dart';
import 'package:recipes_for_sweets_app/data/sweets.dart';
import 'package:recipes_for_sweets_app/design/color.dart';

// ignore: must_be_immutable
class SweetsTile extends StatelessWidget {
  Sweets sweet;
  void Function()? onTap;
  void Function()? onOpen;
  SweetsTile({
    super.key,
    required this.sweet,
    required this.onTap,
    required this.onOpen,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4, 1, 4, 0),
      child: GestureDetector(
        onTap: onOpen,
        child: Container(
          margin: EdgeInsets.all(5),
          width: 280,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      sweet.name,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 22,
                        color: primaryColor,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(width: 4),
                        Container(
                          height: 100,
                          width: 170,
                          child: Text(
                            sweet.description,
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),

                        GestureDetector(
                          onTap: onTap,
                          child: Icon(
                            sweet.toFavorites
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: primaryColor,
                            size: 32,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                        sweet.imageSweet,
                        width: 128,
                        height: 128,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
