import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
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

@JsonSerializable()
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

@JsonSerializable()
class Recipe {
  final String id;
  final String name;
  final String description;
  final String duration;
  final String serving;
  final String calories;
  final String image;
  final List<Ingredient> ingredients;
  final List<Nutrition> nutritions;
  final List<String> categories;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.serving,
    required this.calories,
    required this.image,
    required this.ingredients,
    required this.nutritions,
    required this.categories,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
