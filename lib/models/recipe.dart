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
  final List<String> types;
  final List<String> steps;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.serving,
    required this.calories,
    required this.image,
    this.ingredients = const [],
    this.nutritions = const [],
    this.categories = const [],
    this.types = const [],
    this.steps = const [],
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}

List demoRecipeList = [
  Recipe(
    id: "1",
    name: "Spaghetti",
    description: "Spaghetti is a long, thin, solid, cylindrical pasta.",
    duration: "30",
    serving: "4",
    calories: "500",
    image: "assets/images/spaghetti.jpg",
    ingredients: [
      Ingredient(name: "Spaghetti", quantity: "200g"),
      Ingredient(name: "Tomato", quantity: "200g"),
      Ingredient(name: "Onion", quantity: "100g"),
      Ingredient(name: "Garlic", quantity: "50g"),
      Ingredient(name: "Olive Oil", quantity: "50g"),
      Ingredient(name: "Salt", quantity: "5g"),
      Ingredient(name: "Pepper", quantity: "5g"),
    ],
    nutritions: [
      Nutrition(name: "Carbohydrate", quantity: "50g"),
      Nutrition(name: "Protein", quantity: "20g"),
      Nutrition(name: "Fat", quantity: "10g"),
    ],
    categories: ["Dinner", "Lunch"],
    types: ["Pasta"],
  ),
  Recipe(
    id: "2",
    name: "Fried Rice",
    description:
        "Fried rice is a dish of cooked rice that has been stir-fried.",
    duration: "20",
    serving: "4",
    calories: "400",
    image: "assets/images/fried_rice.jpg",
    ingredients: [
      Ingredient(name: "Rice", quantity: "200g"),
      Ingredient(name: "Carrot", quantity: "100g"),
      Ingredient(name: "Peas", quantity: "100g"),
      Ingredient(name: "Egg", quantity: "50g"),
      Ingredient(name: "Soy Sauce", quantity: "50g"),
      Ingredient(name: "Salt", quantity: "5g"),
      Ingredient(name: "Pepper", quantity: "5g"),
    ],
    nutritions: [
      Nutrition(name: "Carbohydrate", quantity: "40g"),
      Nutrition(name: "Protein", quantity: "15g"),
      Nutrition(name: "Fat", quantity: "5g"),
    ],
    categories: ["Dinner", "Lunch"],
    types: ["Rice"],
  ),
  Recipe(
    id: "3",
    name: "Pizza",
    description: "Pizza is a savory dish of Italian origin.",
    duration: "40",
    serving: "4",
    calories: "600",
    image: "assets/images/pizza.jpg",
    ingredients: [
      Ingredient(name: "Flour", quantity: "200g"),
      Ingredient(name: "Tomato", quantity: "200g"),
      Ingredient(name: "Cheese", quantity: "100g"),
      Ingredient(name: "Onion", quantity: "50g"),
      Ingredient(name: "Olive Oil", quantity: "50g"),
      Ingredient(name: "Salt", quantity: "5g"),
      Ingredient(name: "Pepper", quantity: "5g"),
    ],
    nutritions: [
      Nutrition(name: "Carbohydrate", quantity: "60g"),
      Nutrition(name: "Protein", quantity: "25g"),
      Nutrition(name: "Fat", quantity: "15g"),
    ],
    categories: ["Italian"],
    types: ["Bread"],
  ),
  Recipe(
    id: "4",
    name: "Burger",
    description:
        "A hamburger is a sandwich consisting of one or more cooked patties of ground meat.",
    duration: "30",
    serving: "4",
    calories: "700",
    image: "assets/images/burger.jpg",
    ingredients: [
      Ingredient(name: "Bread", quantity: "200g"),
      Ingredient(name: "Beef", quantity: "200g"),
      Ingredient(name: "Cheese", quantity: "100g"),
      Ingredient(name: "Onion", quantity: "50g"),
      Ingredient(name: "Tomato", quantity: "50g"),
      Ingredient(name: "Salt", quantity: "5g"),
      Ingredient(name: "Pepper", quantity: "5g"),
    ],
    nutritions: [
      Nutrition(name: "Carbohydrate", quantity: "70g"),
      Nutrition(name: "Protein", quantity: "30g"),
      Nutrition(name: "Fat", quantity: "20g"),
    ],
    categories: ["American"],
    types: ["Bread"],
  ),
  Recipe(
    id: "5",
    name: "Pancake",
    description:
        "A pancake is a flat cake, often thin and round, prepared from a starch-based batter that may contain eggs, milk, and butter and cooked on a hot surface such as a griddle or frying pan, often frying with oil or butter.",
    duration: "20",
    serving: "4",
    calories: "300",
    image: "assets/images/pancake.jpg",
    ingredients: [
      Ingredient(name: "Flour", quantity: "200g"),
      Ingredient(name: "Milk", quantity: "200g"),
      Ingredient(name: "Egg", quantity: "100g"),
      Ingredient(name: "Butter", quantity: "50g"),
      Ingredient(name: "Sugar", quantity: "50g"),
      Ingredient(name: "Salt", quantity: "5g"),
      Ingredient(name: "Baking Powder", quantity: "5g"),
    ],
    nutritions: [
      Nutrition(name: "Carbohydrate", quantity: "30g"),
      Nutrition(name: "Protein", quantity: "10g"),
      Nutrition(name: "Fat", quantity: "5g"),
    ],
    categories: ["Breakfast"],
    types: ["Bread"],
  ),
];
