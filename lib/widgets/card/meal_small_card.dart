import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/meal.dart';

enum CardType { meal, recipe }

class MealSmallCard extends StatelessWidget {
  final Meal meal;
  final CardType? type;

  const MealSmallCard({
    Key? key,
    required this.meal,
    this.type = CardType.meal,
  }) : super(key: key);

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(meal.recipe.image),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meal.recipe.name,
                              textAlign: TextAlign.start,
                              style: context.title,
                            ),
                            const SizedBox(height: 2),
                            Text(
                              meal.recipe.description,
                              textAlign: TextAlign.start,
                              style: context.description,
                              maxLines: 2,
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset(
                        "assets/icons/Menu.svg",
                        width: 18,
                        height: 18,
                        colorFilter: ColorFilter.mode(
                          context.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/watch.svg",
                                width: 12,
                                height: 12,
                                colorFilter: ColorFilter.mode(
                                  context.primary,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                meal.recipe.duration,
                                textAlign: TextAlign.start,
                                style: context.smallDescription,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/Fire.svg",
                                width: 12,
                                height: 12,
                                colorFilter: ColorFilter.mode(
                                  context.primary,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                meal.recipe.calories,
                                textAlign: TextAlign.start,
                                style: context.smallDescription,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      type == CardType.meal
                          ? eatMealButton(context)
                          : addRecipeButton(context),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget eatMealButton(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: context.onSecondary,
      borderRadius: const BorderRadius.all(
        Radius.circular(4),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: SvgPicture.asset(
        "assets/icons/Spoon.svg",
        width: 18,
        height: 18,
        colorFilter: ColorFilter.mode(
          context.onPrimary,
          BlendMode.srcIn,
        ),
      ),
    ),
  );
}

Widget addRecipeButton(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: context.primary,
      borderRadius: const BorderRadius.all(
        Radius.circular(4),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: SvgPicture.asset(
        "assets/icons/Plus.svg",
        width: 18,
        height: 18,
        colorFilter: ColorFilter.mode(
          context.onPrimary,
          BlendMode.srcIn,
        ),
      ),
    ),
  );
}
