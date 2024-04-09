import 'package:json_annotation/json_annotation.dart';
import 'package:meal_prep/core/database/local_entity.dart';
import 'package:meal_prep/models/meal.dart';
import 'package:meal_prep/models/recipe.dart';

part 'user.g.dart';

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
class User implements LocalEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String imageUrl;
  final String email;
  final bool isLoggedIn;
  final String gender;
  final int age;
  final int height;
  final int weight;
  final List<Meal> meals;
  final List<FavoriteMeal> favoriteMeals;
  final List<PersonalRecipe> personalRecipes;
  final List<ShoppingList> shoppingList;
  final DateTime joinedAt;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.imageUrl,
    required this.email,
    required this.isLoggedIn,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.meals,
    required this.favoriteMeals,
    required this.personalRecipes,
    required this.shoppingList,
    required this.joinedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  // Choose one of person field to be the key
  // this key will be used to save to local database
  @override
  String get key => id;
}
