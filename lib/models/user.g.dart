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
      account: Account.fromJson(json['account'] as Map<String, dynamic>),
      isLoggedIn: json['isLoggedIn'] as bool,
      age: json['age'] as int,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
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
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'account': instance.account,
      'isLoggedIn': instance.isLoggedIn,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'meals': instance.meals,
      'favoriteMeals': instance.favoriteMeals,
      'personalRecipes': instance.personalRecipes,
      'shoppingList': instance.shoppingList,
    };
