import 'package:flutter/material.dart';
import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/widgets/card/meal_small_card.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';

class MealWidget extends StatelessWidget {
  final String title;
  final List<Recipe> recipeList;

  const MealWidget({
    Key? key,
    required this.title,
    required this.recipeList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHeadingText(title: title),
          const SizedBox(height: 8),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: recipeList.length,
            itemBuilder: (BuildContext context, int index) {
              return MealSmallCard(
                recipe: recipeList[index],
              );
            },
          ),
        ],
      ),
    );
  }
}
