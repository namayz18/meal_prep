import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/widgets/widget/custom_network_image.dart';

class MealCard extends StatelessWidget {
  final Recipe recipe;
  const MealCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: CustomNetworkImage(imageUrl: recipe.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    textAlign: TextAlign.start,
                    style: context.title,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    recipe.description,
                    textAlign: TextAlign.start,
                    style: context.description,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${recipe.duration}, ${recipe.calories}',
                    textAlign: TextAlign.start,
                    style: context.smallDescription,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: context.primary,
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
                        style: context.smallButton,
                      ),
                    ),
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
