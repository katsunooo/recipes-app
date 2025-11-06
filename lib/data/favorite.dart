import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:recipes_for_sweets_app/data/sweets.dart';

class Favorite extends ChangeNotifier {
  // базу делаю
  static const _allSweetsBox = "allSweetsBox";
  static const _favSweetsBox = "favSweetsBox";

  List<Sweets> _sweetRecipes = [
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

  List<Sweets> _userFavorite = [];

  List<Sweets> get sweetRecipes => _sweetRecipes;
  List<Sweets> get userFavorite => _userFavorite;

  Favorite() {
    loadData();
    loadDataFav();
  }

  //синхроню состояние

  void syncToFavorite() {
    for (var sweet in _sweetRecipes) {
      sweet.toFavorites = _userFavorite.any((s) => s.name == sweet.name);
    }
    // ждем когда дерево отстроится...
    Future.delayed(Duration.zero, () {
      notifyListeners();
    });
  }

  Future<void> loadData() async {
    try {
      final box = await Hive.openBox(_allSweetsBox);
      _sweetRecipes = box.isEmpty
          ? _sweetRecipes
          : box.values.toList().cast<Sweets>();
      notifyListeners();
    } catch (e) {
      print('Ошибка загрузки данных: $e');
    }
  }

  Future<void> loadDataFav() async {
    try {
      final box = await Hive.openBox<Sweets>(_favSweetsBox);
      _userFavorite = box.isEmpty ? [] : box.values.toList().cast<Sweets>();

      for (var sweet in _sweetRecipes) {
        sweet.toFavorites = _userFavorite.any((s) => s.name == sweet.name);
      }
      syncToFavorite();
    } catch (e) {
      print("Ошибка загрузки данных в избранном");
    }
  }

  Future<void> addToFav(Sweets sweet) async {
    try {
      final box = await Hive.openBox<Sweets>(_favSweetsBox);
      final isAlreadyFav = _userFavorite.any((s) => s.name == sweet.name);
      if (!isAlreadyFav) {
        await box.add(sweet);
        _userFavorite.add(sweet);
        sweet.toFavorites = true;
        notifyListeners();
      }
    } catch (e) {
      print("Ошибка добавления");
    }
  }

  Future<void> removeFromFav(Sweets sweet) async {
    try {
      final box = await Hive.openBox<Sweets>(_favSweetsBox);
      final keys = box.keys.toList();
      for (var key in keys) {
        final storedSweet = box.get(key);
        if (storedSweet != null && storedSweet.name == sweet.name) {
          await box.delete(key);
          _userFavorite.removeWhere((s) => s.name == sweet.name);
          sweet.toFavorites = false;
          syncToFavorite();

          break;
        }
      }
    } catch (e) {
      print('ошибка удаления');
    }
  }
}
