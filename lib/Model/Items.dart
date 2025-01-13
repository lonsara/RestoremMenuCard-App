import 'dart:ui';

class Items{
  late  String id;
  late String url;
  late String tittle;
  late String duration;
  late String complexity;
  late String affortability;
  late List<String> categories;
  late List<String> ingredients;
  late List<String> steps;
  late final bool isGlutenFree;
  late final bool isLactoseFree;
  late final bool isVegan;
  late final bool isVegetarian;


   Items({
    required this.id,
    required this.url,
    required this.tittle,
    required this.duration,
    required this.complexity,
    required this.affortability,
    required this.categories,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian
});
}