import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/utils.dart';
import 'package:meal_prep/views/recipe/recipe_view.dart';
import 'package:meal_prep/widgets/widget/custom_network_image.dart';

class PlanCard extends StatelessWidget {
  final Recipe recipe;

  const PlanCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeView(
              recipe: recipe,
            ),
          ),
        );
      },
      child: Container(
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
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.hardEdge,
                child: CustomNetworkImage(imageUrl: recipe.imageUrl),
              ),
              const SizedBox(width: 16),
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
                                capitalizeFirstLetter(recipe.category),
                                textAlign: TextAlign.start,
                                style: context.heading,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                recipe.name,
                                textAlign: TextAlign.start,
                                style: context.title,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                recipe.description,
                                textAlign: TextAlign.start,
                                style: context.description,
                                maxLines: 1,
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
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
                                  recipe.duration,
                                  textAlign: TextAlign.start,
                                  style: context.smallDescription,
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
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
                                  "${recipe.calories} kcal",
                                  textAlign: TextAlign.start,
                                  style: context.smallDescription,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
