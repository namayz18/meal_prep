import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/recipe.dart';

class MealTileCard extends StatelessWidget {
  final Recipe recipe;
  const MealTileCard({Key? key, required this.recipe}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(recipe.imageUrl),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe.name,
                      textAlign: TextAlign.start,
                      style: context.title,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
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
                          "${recipe.calories} kcal",
                          textAlign: TextAlign.start,
                          style: context.smallDescription,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                "assets/icons/Right.svg",
                width: 32,
                height: 32,
                colorFilter: ColorFilter.mode(
                  context.buttonColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
