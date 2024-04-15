// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) => Meal(
      id: json['id'] as String,
      category: json['category'] as String,
      time: json['time'] as String,
      calories: (json['calories'] as num).toDouble(),
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
      eaten: json['eaten'] as bool? ?? false,
    );

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'time': instance.time,
      'calories': instance.calories,
      'recipe': instance.recipe.toJson(),
      'eaten': instance.eaten,
    };

ActivePlan _$ActivePlanFromJson(Map<String, dynamic> json) => ActivePlan(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      totalDays: json['totalDays'] as int,
      completedDays: json['completedDays'] as int,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      mealList: (json['mealList'] as List<dynamic>?)
              ?.map((e) => (e as List<dynamic>)
                  .map((e) => Meal.fromJson(e as Map<String, dynamic>))
                  .toList())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ActivePlanToJson(ActivePlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'totalDays': instance.totalDays,
      'completedDays': instance.completedDays,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'mealList': instance.mealList
          .map((e) => e.map((e) => e.toJson()).toList())
          .toList(),
    };

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      totalDays: json['totalDays'] as int,
      imageUrl: json['imageUrl'] as String,
      recipeList: (json['recipeList'] as List<dynamic>)
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'totalDays': instance.totalDays,
      'imageUrl': instance.imageUrl,
      'recipeList': instance.recipeList.map((e) => e.toJson()).toList(),
    };
