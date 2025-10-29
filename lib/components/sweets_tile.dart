import 'package:flutter/material.dart';
import 'package:recipes_for_sweets_app/sweets.dart';

class SweetsTile extends StatelessWidget {
  Sweets sweet;
  void Function()? onTap;
  SweetsTile({super.key, required this.sweet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(5),
        width: 280,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 221, 200, 207),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Text(sweet.name),
              Row(
                children: [
                  Image.asset(sweet.imageSweet, width: 150, height: 150,),
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 200,
                        child: Text(sweet.description,maxLines: 6,)),
                      GestureDetector(
                        onTap: onTap,
                        child: Icon(
                          sweet.toFavorites == false
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: const Color.fromARGB(255, 226, 20, 89),
                              size: 28,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}