import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/widgets/card/meal_small_card.dart';

class MealCategoryWidget extends StatelessWidget {
  final String title;
  final Recipe? recipe;
  final String recommendedCalories;
  final String time;
  const MealCategoryWidget(
      {super.key,
      required this.title,
      required this.recipe,
      required this.recommendedCalories,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: context.heading,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        'Recommended:',
                        style: context.smallDescription,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        recommendedCalories,
                        style: context.smallDescription,
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        'Time:',
                        style: context.smallDescription,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        time,
                        style: context.smallDescription,
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              recipe == null
                  ? Container(
                      decoration: BoxDecoration(
                        color: context.primary.withOpacity(0.1),
                        border: Border.all(
                          color: context.border,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/icons/Plus.svg",
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            context.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          recipe == null
              ? const SizedBox()
              : Column(
                  children: [
                    const SizedBox(height: 16.0),
                    MealSmallCard(recipe: recipe!),
                  ],
                ),
        ],
      ),
    );
  }
}
