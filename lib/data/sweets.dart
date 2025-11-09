import 'package:hive/hive.dart';

part 'sweets.g.dart';

@HiveType(typeId: 0)
class Sweets {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String imageSweet;
  @HiveField(3)
  final String description;
  @HiveField(4)
  bool toFavorites;
  @HiveField(5)
  final List<Ingredient> ingredients;
  @HiveField(6)
  final Nutrition nutrition;
  @HiveField(7)
  final List<CookingStep> cookingSteps;
  @HiveField(8)
  final List<String> categories;

  Sweets({
    required this.id,
    required this.name,
    required this.imageSweet,
    required this.description,
    required this.toFavorites,
    required this.ingredients,
    required this.nutrition,
    required this.cookingSteps,
    required this.categories,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Sweets && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

@HiveType(typeId: 1)
class Ingredient {
  @HiveField(0)
  final String name;
  @HiveField(1)
  bool onHand;
  @HiveField(2)
  String? unit;
  @HiveField(3)
  double? count;

  Ingredient({required this.name, this.onHand = false, this.unit, this.count});
}

@HiveType(typeId: 2)
class Nutrition {
  @HiveField(0)
  final double calories;
  @HiveField(1)
  final double proteins;
  @HiveField(2)
  final double fats;
  @HiveField(3)
  final double carbohydrates;

  Nutrition({
    required this.calories,
    required this.proteins,
    required this.fats,
    required this.carbohydrates,
  });
}

@HiveType(typeId: 3)
class CookingStep {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;

  CookingStep({required this.title, required this.description});
}
