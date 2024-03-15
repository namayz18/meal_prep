import 'package:json_annotation/json_annotation.dart';
import 'package:meal_prep/core/helper/local_entity.dart';
import 'package:meal_prep/models/meal.dart';

part 'account.g.dart';

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
  final Meal? meal;

  Account({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.height,
    required this.weight,
    required this.imageUrl,
    this.meal,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);

  // Choose one of person field to be the key
  // this key will be used to save to local database
  @override
  String get key => id;
}
