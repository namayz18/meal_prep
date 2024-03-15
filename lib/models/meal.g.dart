// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      id: json['id'] as String,
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
      eaten: json['eaten'] as bool,
      date: json['date'] as String,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'recipe': instance.recipe,
      'eaten': instance.eaten,
      'date': instance.date,
    };
