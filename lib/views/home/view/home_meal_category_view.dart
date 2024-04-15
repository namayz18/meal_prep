import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/plan.dart';
import 'package:meal_prep/utils.dart';
import 'package:meal_prep/views/home/controller/home_view_controller.dart';
import 'package:meal_prep/views/home/widgets/meal_category_widget.dart';

class HomeMealCategoryView extends StatelessWidget {
  final HomeViewController controller;
  final DateTime selectedDate;

  const HomeMealCategoryView({
    Key? key,
    required this.controller,
    required this.selectedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Meal> meals = controller.getMeals(selectedDate);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: meals.length,
      itemBuilder: (context, index) {
        final meal = meals[index];
        return Column(
          children: [
            Container(
              height: 16,
              color: context.border,
            ),
            MealCategoryWidget(
              title: capitalizeFirstLetter(meal.category),
              recommendedCalories: '400 kcal',
              time: '7:00 AM',
              recipe: meal.recipe,
            ),
          ],
        );
      },
    );
  }
}
