// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      name: json['name'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
    };

Nutrition _$NutritionFromJson(Map<String, dynamic> json) => Nutrition(
      name: json['name'] as String,
      quantity: json['quantity'] as String,
    );

Map<String, dynamic> _$NutritionToJson(Nutrition instance) => <String, dynamic>{
      'name': instance.name,
      'quantity': instance.quantity,
    };

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      duration: json['duration'] as String,
      serving: json['serving'] as String,
      calories: json['calories'] as String,
      image: json['image'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      nutritions: (json['nutritions'] as List<dynamic>)
          .map((e) => Nutrition.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'duration': instance.duration,
      'serving': instance.serving,
      'calories': instance.calories,
      'image': instance.image,
      'ingredients': instance.ingredients,
      'nutritions': instance.nutritions,
      'categories': instance.categories,
    };
