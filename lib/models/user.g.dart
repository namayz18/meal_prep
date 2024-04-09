// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteMeal _$FavoriteMealFromJson(Map<String, dynamic> json) => FavoriteMeal(
      id: json['id'] as String,
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteMealToJson(FavoriteMeal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipe': instance.recipe,
    };

PersonalRecipe _$PersonalRecipeFromJson(Map<String, dynamic> json) =>
    PersonalRecipe(
      id: json['id'] as String,
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonalRecipeToJson(PersonalRecipe instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipe': instance.recipe,
    };

ShoppingList _$ShoppingListFromJson(Map<String, dynamic> json) => ShoppingList(
      id: json['id'] as String,
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShoppingListToJson(ShoppingList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipe': instance.recipe,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      imageUrl: json['imageUrl'] as String,
      email: json['email'] as String,
      isLoggedIn: json['isLoggedIn'] as bool,
      gender: json['gender'] as String,
      age: json['age'] as int,
      height: json['height'] as int,
      weight: json['weight'] as int,
      meals: (json['meals'] as List<dynamic>)
          .map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoriteMeals: (json['favoriteMeals'] as List<dynamic>)
          .map((e) => FavoriteMeal.fromJson(e as Map<String, dynamic>))
          .toList(),
      personalRecipes: (json['personalRecipes'] as List<dynamic>)
          .map((e) => PersonalRecipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      shoppingList: (json['shoppingList'] as List<dynamic>)
          .map((e) => ShoppingList.fromJson(e as Map<String, dynamic>))
          .toList(),
      joinedAt: DateTime.parse(json['joinedAt'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'imageUrl': instance.imageUrl,
      'email': instance.email,
      'isLoggedIn': instance.isLoggedIn,
      'gender': instance.gender,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'meals': instance.meals,
      'favoriteMeals': instance.favoriteMeals,
      'personalRecipes': instance.personalRecipes,
      'shoppingList': instance.shoppingList,
      'joinedAt': instance.joinedAt.toIso8601String(),
    };
