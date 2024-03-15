import 'package:json_annotation/json_annotation.dart';
import 'package:meal_prep/core/helper/local_entity.dart';
import 'package:meal_prep/models/meal.dart';
import 'package:meal_prep/models/recipe.dart';

part 'account.g.dart';

@JsonSerializable()
class FavoriteMeal {
  final String id;
  final Recipe recipe;

  FavoriteMeal({
    required this.id,
    required this.recipe,
  });

  factory FavoriteMeal.fromJson(Map<String, dynamic> json) =>
      _$FavoriteMealFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteMealToJson(this);
}

@JsonSerializable()
class PersonalRecipe {
  final String id;
  final Recipe recipe;

  PersonalRecipe({
    required this.id,
    required this.recipe,
  });

  factory PersonalRecipe.fromJson(Map<String, dynamic> json) =>
      _$PersonalRecipeFromJson(json);

  Map<String, dynamic> toJson() => _$PersonalRecipeToJson(this);
}

@JsonSerializable()
class ShoppingList {
  final String id;
  final Recipe recipe;

  ShoppingList({
    required this.id,
    required this.recipe,
  });

  factory ShoppingList.fromJson(Map<String, dynamic> json) =>
      _$ShoppingListFromJson(json);

  Map<String, dynamic> toJson() => _$ShoppingListToJson(this);
}

// don't forget to add fromJson and toJson
@JsonSerializable()
class Account implements LocalEntity {
  final String id;
  final String firstName;
  final String lastName;
  final int age;
  final double height;
  final double weight;
  final String imageUrl;
  final List<Meal>? meals;
  final List<FavoriteMeal>? favoriteMeals;
  final List<PersonalRecipe>? personalRecipes;
  final List<ShoppingList>? shoppingList;

  Account({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.height,
    required this.weight,
    required this.imageUrl,
    this.meals,
    this.favoriteMeals,
    this.personalRecipes,
    this.shoppingList,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  // Choose one of person field to be the key
  // this key will be used to save to local database
  @override
  String get key => id;
}
