import 'dart:ui';

class Fruit {
  final String title;
  final String headline;
  final String image;
  final List<Color> gradientColors;
  final String description;
  final List<String> nutrition;

  const Fruit({
    required this.title,
    required this.headline,
    required this.image,
    required this.gradientColors,
    required this.description,
    required this.nutrition,
  });
}
