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
  final double calories;
  final double carbs;
  final double protein;
  final double fat;
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
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.imageUrl,
    this.ingredients = const [],
    this.nutritions = const [],
    this.types = const [],
    this.steps = const [],
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

List<Recipe> recipeData = [
  // Recipe(
  //   id: Uuid().v4(),
  //   name: 'Yogurt Snacks',
  //   description: 'A quick and healthy yogurt snack with fruit and nuts.',
  //   category: 'Snack',
  //   duration: '5 minutes',
  //   calories: 150,
  //   carbs: 20,
  //   protein: 6,
  //   fat: 5,
  //   imageUrl: 'https://example.com/image.jpg',
  //   ingredients: [
  //     Ingredient(name: 'Greek yogurt', quantity: '1 cup'),
  //     Ingredient(name: 'Mixed berries', quantity: '1/2 cup'),
  //     Ingredient(name: 'Almonds', quantity: '2 tbsp, chopped'),
  //     Ingredient(name: 'Honey or maple syrup', quantity: '1 tbsp (optional)'),
  //   ],
  //   nutritions: [
  //     Nutrition(name: 'Fiber', quantity: '4'),
  //     Nutrition(name: 'Calcium', quantity: '15'),
  //     Nutrition(name: 'Vitamin C', quantity: '20'),
  //   ],
  //   types: ['Snack', 'Yogurt'],
  //   steps: [
  //     'In a bowl, scoop the Greek yogurt.',
  //     'Top the yogurt with mixed berries and chopped almonds.',
  //     'Drizzle with honey or maple syrup if desired for added sweetness.',
  //     'Enjoy immediately as a refreshing and nutritious snack!',
  //   ],
  // )
];
