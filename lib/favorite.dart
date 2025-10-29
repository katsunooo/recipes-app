import 'package:flutter/material.dart';
import 'package:recipes_for_sweets_app/sweets.dart';

class Favorite extends ChangeNotifier {
  List<Sweets> sweetRecipes = [
    Sweets(
      name: 'Тирамису',
      imageSweet: 'assets/tiramisu.jpg',
      description:
          'Итальянский десерт с многослойной структурой: пропитанное эспрессо печенье савоярди чередуется с воздушным кремом на основе маскарпоне. Посыпка из какао придаёт благородную горчинку и завершает композицию.',
      toFavorites: false,
    ),
    Sweets(
      name: 'Чизкей',
      imageSweet: 'assets/chize-cake.jpg',
      description:
          'Нежный десерт с кремовой текстурой: сливочно‑творожная начинка на основе сливочного сыра (маскарпоне, филадельфия) покоится на хрустящей основе из измельчённого печенья. Часто дополняется ягодами, фруктами или карамелью.',
      toFavorites: false,
    ),
    Sweets(
      name: 'Медовик',
      imageSweet: 'assets/honey-cake.jpg',
      description:
          'Тёплый, медовый торт с тонкими нежными коржами, пропитанными ароматным заварным или сметанным кремом. Отличается насыщенным золотистым цветом и мягким, слегка пряным вкусом.',
      toFavorites: false,
    ),
    Sweets(
      name: 'Красный бархат',
      imageSweet: 'assets/red-cake.jpg',
      description:
          'Эффектный торт с бархатистыми ярко‑красными коржами и лёгким шоколадным послевкусием. Нежный сливочный крем уравновешивает текстуру и придаёт десерту изысканный, сбалансированный вкус.',
      toFavorites: false,
    ),
  ];

  List<Sweets> userFavorite = [];

  List<Sweets> getSweetsList() {
    return sweetRecipes;
  }

  List<Sweets> getUserFavorite() {
    return userFavorite;
  }

  void addItemToFavorite(Sweets sweet) {
    userFavorite.add(sweet);
    notifyListeners();
  }

  void remoteItemFavorite(Sweets sweet) {
    userFavorite.remove(sweet);
    notifyListeners();
  }
}
