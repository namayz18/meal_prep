import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/meal.dart';

class MealGridCard extends StatelessWidget {
  final Meal meal;
  const MealGridCard({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.onPrimary,
        border: Border.all(
          color: context.border,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(meal.recipe.imageUrl),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.recipe.name,
                  textAlign: TextAlign.start,
                  style: context.title,
                ),
                const SizedBox(height: 4),
                Text(
                  meal.recipe.description,
                  textAlign: TextAlign.start,
                  style: context.description,
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: context.border,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: Text(
                      'Eaten',
                      style: context.button,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
