import 'package:hive/hive.dart';

part 'sweets.g.dart';

@HiveType(typeId: 0)
class Sweets {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String imageSweet;
  @HiveField(2)
  final String description;
  @HiveField(3)
  bool toFavorites;

  Sweets({
    required this.name,
    required this.imageSweet,
    required this.description,
    required this.toFavorites,
  });
}
