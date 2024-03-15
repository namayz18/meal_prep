// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

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

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: json['age'] as int,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      meals: (json['meals'] as List<dynamic>?)
          ?.map((e) => Meal.fromJson(e as Map<String, dynamic>))
          .toList(),
      favoriteMeals: (json['favoriteMeals'] as List<dynamic>?)
          ?.map((e) => FavoriteMeal.fromJson(e as Map<String, dynamic>))
          .toList(),
      personalRecipes: (json['personalRecipes'] as List<dynamic>?)
          ?.map((e) => PersonalRecipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      shoppingList: (json['shoppingList'] as List<dynamic>?)
          ?.map((e) => ShoppingList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'imageUrl': instance.imageUrl,
      'meals': instance.meals,
      'favoriteMeals': instance.favoriteMeals,
      'personalRecipes': instance.personalRecipes,
      'shoppingList': instance.shoppingList,
    };
