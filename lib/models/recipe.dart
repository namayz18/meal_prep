import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable(explicitToJson: true)
class Ingredient {
  final String name;
  final String quantity;

  Ingredient({
    required this.name,
    required this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Nutrition {
  final String name;
  final String quantity;

  Nutrition({
    required this.name,
    required this.quantity,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) =>
      _$NutritionFromJson(json);

  Map<String, dynamic> toJson() => _$NutritionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Recipe {
  final String id;
  final String name;
  final String description;
  final String category;
  final String duration;
  final String calories;
  final String imageUrl;
  final List<Ingredient> ingredients;
  final List<Nutrition> nutritions;
  final List<String> types;
  final List<String> steps;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.duration,
    required this.calories,
    required this.imageUrl,
    this.ingredients = const [],
    this.nutritions = const [],
    this.types = const [],
    this.steps = const [],
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
