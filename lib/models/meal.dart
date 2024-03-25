import 'package:json_annotation/json_annotation.dart';
import 'package:meal_prep/models/recipe.dart';

part 'meal.g.dart';

@JsonSerializable()
class Meal {
  final String id;
  final String category;
  final Recipe recipe;
  final bool eaten;
  final String date;

  Meal({
    required this.id,
    required this.category,
    required this.recipe,
    required this.eaten,
    required this.date,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);
}

List<Meal> mealList = [];

// List<Meal> mealList = mealData
//     .map((item) => Meal(
//           id: item['id'].toString(),
//           recipe: item['recipe'] as Recipe,
//           eaten: item['eaten'] as bool,
//           date: item['date'].toString(),
//         ))
//     .toList();

// var mealData = [
//   {"id": "1", "recipe": recipeList[0], "eaten": false, "date": "2022-10-10"},
//   {"id": "2", "recipe": recipeList[1], "eaten": false, "date": "2022-10-10"},
// ];
