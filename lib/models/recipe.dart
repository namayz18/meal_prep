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

List<Recipe> recipeList = recipeData
    .map((item) => Recipe(
          id: item['id'].toString(),
          name: item['name'].toString(),
          description: item['description'].toString(),
          duration: item['duration'].toString(),
          serving: item['serving'].toString(),
          calories: item['calories'].toString(),
          image: item['image'].toString(),
          ingredients: (item['ingredients'] as List?)!
              .map<Ingredient>((item) => Ingredient(
                  name: item['name'].toString(),
                  quantity: item['quantity'].toString()))
              .toList(),
          nutritions: (item['nutritions'] as List?)!
              .map<Nutrition>((item) => Nutrition(
                  name: item['name'].toString(),
                  quantity: item['quantity'].toString()))
              .toList(),
          categories: ['Lunch'],
        ))
    .toList();

var recipeData = [
  {
    "id": "1",
    "name": "Chicken Noodle Soup",
    "description": "Classic soup",
    "duration": "45 minutes",
    "serving": "4",
    "calories": "450 kcal per serving",
    "image":
        "https://www.budgetbytes.com/wp-content/uploads/2017/02/Homemade-Chicken-Noodle-Soup-ladle-e-768x576.jpg",
    "ingredients": [
      {"name": "Chicken", "quantity": "200g"},
      {"name": "Noodle", "quantity": "100g"},
      {"name": "Carrot", "quantity": "50g"},
      {"name": "Onion", "quantity": "50g"},
      {"name": "Celery", "quantity": "50g"},
      {"name": "Garlic", "quantity": "10g"},
      {"name": "Olive Oil", "quantity": "20g"},
      {"name": "Salt", "quantity": "5g"},
      {"name": "Pepper", "quantity": "5g"},
      {"name": "Water", "quantity": "500ml"},
    ],
    "nutritions": [
      {"name": "Calories", "quantity": "450kcal"},
      {"name": "Protein", "quantity": "20g"},
      {"name": "Fat", "quantity": "10g"},
      {"name": "Carbohydrate", "quantity": "30g"},
      {"name": "Fiber", "quantity": "5g"},
      {"name": "Sugar", "quantity": "5g"},
      {"name": "Sodium", "quantity": "500mg"},
      {"name": "Cholesterol", "quantity": "50mg"},
      {"name": "Vitamin A", "quantity": "1000IU"},
      {"name": "Vitamin C", "quantity": "10mg"},
      {"name": "Calcium", "quantity": "100mg"},
      {"name": "Iron", "quantity": "5mg"},
    ],
    "steps": [
      "Step 1: Boil the chicken in water for 20 minutes",
      "Step 2: Remove the chicken and shred it into small pieces",
      "Step 3: In a large pot, heat the olive oil over medium heat",
      "Step 4: Add the onion, carrot, celery, and garlic, and cook until soft",
      "Step 5: Add the shredded chicken, noodles, and water to the pot",
      "Step 6: Season with salt and pepper, and simmer for 15 minutes",
      "Step 7: Serve hot and enjoy!"
    ]
  },
  {
    "id": "2",
    "name": "Classic Homemade Meatloaf",
    "description": "Classic Italian pasta with rich meat sauce",
    "duration": "30 minutes",
    "serving": "4",
    "calories": "500 kcal per serving",
    "image":
        "https://www.budgetbytes.com/wp-content/uploads/2021/09/Classic-Meatloaf-above-768x576.jpg",
    "ingredients": [
      {"name": "Spaghetti", "quantity": "200g"},
      {"name": "Ground Beef", "quantity": "200g"},
      {"name": "Tomato", "quantity": "100g"},
      {"name": "Onion", "quantity": "50g"},
      {"name": "Garlic", "quantity": "10g"},
      {"name": "Olive Oil", "quantity": "20g"},
      {"name": "Salt", "quantity": "5g"},
      {"name": "Pepper", "quantity": "5g"},
      {"name": "Sugar", "quantity": "5g"},
      {"name": "Water", "quantity": "500ml"},
    ],
    "nutritions": [
      {"name": "Calories", "quantity": "500kcal"},
      {"name": "Protein", "quantity": "25g"},
      {"name": "Fat", "quantity": "15g"},
      {"name": "Carbohydrate", "quantity": "35g"},
      {"name": "Fiber", "quantity": "5g"},
      {"name": "Sugar", "quantity": "5g"},
      {"name": "Sodium", "quantity": "500mg"},
      {"name": "Cholesterol", "quantity": "50mg"},
      {"name": "Vitamin A", "quantity": "1000IU"},
      {"name": "Vitamin C", "quantity": "10mg"},
      {"name": "Calcium", "quantity": "100mg"},
      {"name": "Iron", "quantity": "5mg"},
    ],
    "steps": [
      "Step 1: Boil the spaghetti in water for 10 minutes",
      "Step 2: In a large pot, heat the olive oil over medium heat",
      "Step 3: Add the onion and garlic, and cook until",
    ]
  },
  {
    "id": "3",
    "name": "Homemade Mac and Cheese",
    "description":
        "Creamy roux-based cheese sauce that will satisfy all of your cheesy pasta cravings",
    "duration": "45 minutes",
    "serving": "4",
    "calories": "450 kcal per serving",
    "image":
        "https://www.budgetbytes.com/wp-content/uploads/2021/12/Homemade-Mac-and-Cheese-above-768x512.jpg",
    "ingredients": [
      {"name": "Chicken", "quantity": "200g"},
      {"name": "Noodle", "quantity": "100g"},
      {"name": "Carrot", "quantity": "50g"},
      {"name": "Onion", "quantity": "50g"},
      {"name": "Celery", "quantity": "50g"},
      {"name": "Garlic", "quantity": "10g"},
      {"name": "Olive Oil", "quantity": "20g"},
      {"name": "Salt", "quantity": "5g"},
      {"name": "Pepper", "quantity": "5g"},
      {"name": "Water", "quantity": "500ml"},
    ],
    "nutritions": [
      {"name": "Calories", "quantity": "450kcal"},
      {"name": "Protein", "quantity": "20g"},
      {"name": "Fat", "quantity": "10g"},
      {"name": "Carbohydrate", "quantity": "30g"},
      {"name": "Fiber", "quantity": "5g"},
      {"name": "Sugar", "quantity": "5g"},
      {"name": "Sodium", "quantity": "500mg"},
      {"name": "Cholesterol", "quantity": "50mg"},
      {"name": "Vitamin A", "quantity": "1000IU"},
      {"name": "Vitamin C", "quantity": "10mg"},
      {"name": "Calcium", "quantity": "100mg"},
      {"name": "Iron", "quantity": "5mg"},
    ],
    "steps": [
      "Step 1: Boil the chicken in water for 20 minutes",
      "Step 2: Remove the chicken and shred it into small pieces",
      "Step 3: In a large pot, heat the olive oil over medium heat",
    ]
  }
];
