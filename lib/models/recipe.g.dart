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
      category: json['category'] as String,
      duration: json['duration'] as String,
      calories: (json['calories'] as num).toDouble(),
      carbs: (json['carbs'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String,
      ingredients: (json['ingredients'] as List<dynamic>?)
              ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      nutritions: (json['nutritions'] as List<dynamic>?)
              ?.map((e) => Nutrition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      steps:
          (json['steps'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'duration': instance.duration,
      'calories': instance.calories,
      'carbs': instance.carbs,
      'protein': instance.protein,
      'fat': instance.fat,
      'imageUrl': instance.imageUrl,
      'ingredients': instance.ingredients.map((e) => e.toJson()).toList(),
      'nutritions': instance.nutritions.map((e) => e.toJson()).toList(),
      'types': instance.types,
      'steps': instance.steps,
    };
