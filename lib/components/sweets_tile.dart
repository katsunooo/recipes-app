import 'package:flutter/material.dart';
import 'package:recipes_for_sweets_app/design/color.dart';
import 'package:recipes_for_sweets_app/sweets.dart';

class SweetsTile extends StatelessWidget {
  Sweets sweet;
  void Function()? onTap;
  SweetsTile({super.key, required this.sweet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(4, 1, 4, 0),
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
                  Text(sweet.name,
                  style: TextStyle(
                    fontSize: 22,
                    color: primaryColor,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [
                      SizedBox(width: 4,),
                      Container(
                    height: 100,
                    width: 170,
                    child: Text(sweet.description, maxLines: 6, 
                    style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Icon(
                      sweet.toFavorites == false
                          ? Icons.favorite_border
                          : Icons.favorite,
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
                    decoration: BoxDecoration(color: primaryColor,
                    borderRadius: BorderRadius.circular(16)),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16),
                    child: Image.asset(sweet.imageSweet, width: 128, height: 128,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
