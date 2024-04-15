import 'package:json_annotation/json_annotation.dart';
import 'package:meal_prep/models/recipe.dart';

part 'plan.g.dart';

@JsonSerializable(explicitToJson: true)
class Meal {
  final String id;
  final String category;
  final String time;
  final double calories;
  final Recipe recipe;
  final bool eaten;

  Meal({
    required this.id,
    required this.category,
    required this.time,
    required this.calories,
    required this.recipe,
    this.eaten = false,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ActivePlan {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final int totalDays;
  final int completedDays;
  final DateTime startDate;
  final DateTime endDate;
  final List<List<Meal>> mealList;

  ActivePlan({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.totalDays,
    required this.completedDays,
    required this.startDate,
    required this.endDate,
    this.mealList = const [],
  });

  factory ActivePlan.fromJson(Map<String, dynamic> json) =>
      _$ActivePlanFromJson(json);

  Map<String, dynamic> toJson() => _$ActivePlanToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Plan {
  final String id;
  final String title;
  final String description;
  final int totalDays;
  final String imageUrl;
  final List<Recipe> recipeList;

  Plan({
    required this.id,
    required this.title,
    required this.description,
    required this.totalDays,
    required this.imageUrl,
    required this.recipeList,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}

// List<Recipe> recipeList = [
//   Recipe(
//     id: '1',
//     name: 'Oatmeal',
//     description: 'Oatmeal is a healthy breakfast option.',
//     category: 'breakfast',
//     duration: '10 minutes',
//     calories: 200.0,
//     protein: 5.0,
//     carbs: 30.0,
//     fat: 3.0,
//     imageUrl:
//         'https://www.budgetbytes.com/wp-content/uploads/2021/08/Cheese-Grits-plate-500x500.jpg',
//     ingredients: [
//       Ingredient(name: 'Oats', quantity: '1 cup'),
//       Ingredient(name: 'Milk', quantity: '1 cup'),
//       Ingredient(name: 'Honey', quantity: '1 tbsp'),
//     ],
//     nutritions: [
//       Nutrition(name: 'Protein', quantity: '5g'),
//       Nutrition(name: 'Carbs', quantity: '30g'),
//       Nutrition(name: 'Fat', quantity: '3g'),
//     ],
//     types: ['Vegan', 'Vegetarian'],
//     steps: [
//       'Boil the oats in milk.',
//       'Add honey and mix well.',
//       'Serve hot.',
//     ],
//   ),
//   Recipe(
//     id: '2',
//     name: 'Salad',
//     description: 'Salad is a healthy meal option.',
//     category: 'lunch',
//     duration: '15 minutes',
//     calories: 300.0,
//     protein: 5.0,
//     carbs: 30.0,
//     fat: 3.0,
//     imageUrl:
//         'https://www.budgetbytes.com/wp-content/uploads/2021/08/Cheese-Grits-plate-500x500.jpg',
//     ingredients: [
//       Ingredient(name: 'Lettuce', quantity: '1 cup'),
//       Ingredient(name: 'Tomato', quantity: '1'),
//       Ingredient(name: 'Cucumber', quantity: '1'),
//     ],
//     nutritions: [
//       Nutrition(name: 'Protein', quantity: '5g'),
//       Nutrition(name: 'Carbs', quantity: '30g'),
//       Nutrition(name: 'Fat', quantity: '3g'),
//     ],
//     types: ['Vegan', 'Vegetarian'],
//     steps: [
//       'Chop the vegetables.',
//       'Mix them in a bowl.',
//       'Add dressing and mix well.',
//       'Serve cold.',
//     ],
//   ),
//   Recipe(
//     id: '3',
//     name: 'Grilled Chicken',
//     description: 'Grilled chicken is a healthy dinner option.',
//     category: 'dinner',
//     duration: '20 minutes',
//     calories: 400.0,
//     protein: 20.0,
//     carbs: 10.0,
//     fat: 5.0,
//     imageUrl:
//         'https://www.budgetbytes.com/wp-content/uploads/2021/08/Cheese-Grits-plate-500x500.jpg',
//     ingredients: [
//       Ingredient(name: 'Chicken', quantity: '100g'),
//       Ingredient(name: 'Salt', quantity: '1 tsp'),
//       Ingredient(name: 'Pepper', quantity: '1 tsp'),
//     ],
//     nutritions: [
//       Nutrition(name: 'Protein', quantity: '20g'),
//       Nutrition(name: 'Carbs', quantity: '10g'),
//       Nutrition(name: 'Fat', quantity: '5g'),
//     ],
//     types: ['Non-Vegetarian'],
//     steps: [
//       'Marinate the chicken with salt and pepper.',
//       'Grill the chicken on a pan.',
//       'Serve hot.',
//     ],
//   ),
//   Recipe(
//     id: '4',
//     name: 'Smoothie',
//     description: 'Smoothie is a healthy snack option.',
//     category: 'snack',
//     duration: '5 minutes',
//     calories: 150.0,
//     protein: 5.0,
//     carbs: 30.0,
//     fat: 3.0,
//     imageUrl:
//         'https://www.budgetbytes.com/wp-content/uploads/2021/08/Cheese-Grits-plate-500x500.jpg',
//     ingredients: [
//       Ingredient(name: 'Banana', quantity: '1'),
//       Ingredient(name: 'Milk', quantity: '1 cup'),
//       Ingredient(name: 'Honey', quantity: '1 tbsp'),
//     ],
//     nutritions: [
//       Nutrition(name: 'Protein', quantity: '5g'),
//       Nutrition(name: 'Carbs', quantity: '30g'),
//       Nutrition(name: 'Fat', quantity: '3g'),
//     ],
//     types: ['Vegan', 'Vegetarian'],
//     steps: [
//       'Blend the banana and milk.',
//       'Add honey and blend again.',
//       'Serve cold.',
//     ],
//   ),
// ];

// List<Meal> mealList = [
//   Meal(
//     id: '1',
//     category: 'breakfast',
//     time: '8:00 AM',
//     calories: 200.0,
//     recipe: recipeList[0],
//     eaten: false,
//   ),
//   Meal(
//     id: '2',
//     category: 'lunch',
//     time: '1:00 PM',
//     calories: 300.0,
//     recipe: recipeList[1],
//     eaten: false,
//   ),
//   Meal(
//     id: '3',
//     category: 'dinner',
//     time: '8:00 PM',
//     calories: 400.0,
//     recipe: recipeList[2],
//     eaten: false,
//   ),
//   Meal(
//     id: '4',
//     category: 'snack',
//     time: '4:00 PM',
//     calories: 150.0,
//     recipe: recipeList[3],
//     eaten: false,
//   ),
// ];

// List<Plan> planList = [
//   Plan(
//     id: '1',
//     title: 'Weight Loss',
//     description: 'This plan is designed to help you lose weight.',
//     totalDays: 7,
//     imageUrl:
//         'https://www.budgetbytes.com/wp-content/uploads/2021/09/Classic-Meatloaf-above-768x576.jpg',
//     recipeList: recipeList,
//   ),
//   Plan(
//     id: '2',
//     title: 'Muscle Gain',
//     description: 'This plan is designed to help you gain muscle.',
//     totalDays: 14,
//     imageUrl:
//         'https://www.budgetbytes.com/wp-content/uploads/2017/02/Homemade-Chicken-Noodle-Soup-ladle-e-768x576.jpg',
//     recipeList: recipeList,
//   ),
//   Plan(
//     id: '3',
//     title: 'Maintenance',
//     description:
//         'This plan is designed to help you maintain your weight. This plan is designed to help you maintain your weight.',
//     totalDays: 10,
//     imageUrl:
//         'https://www.budgetbytes.com/wp-content/uploads/2021/12/Homemade-Mac-and-Cheese-above-768x512.jpg',
//     recipeList: recipeList,
//   ),
// ];
