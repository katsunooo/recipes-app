class Sweets {
  final String name;
  final String imageSweet;
  final String description;
  bool toFavorites;

  Sweets({
    required this.name,
    required this.imageSweet,
    required this.description,
    this.toFavorites = false,
  });
}
