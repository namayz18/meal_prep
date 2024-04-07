import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/constants/color.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/widgets/widget/custom_network_image.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final void Function() onTap;
  const RecipeCard({Key? key, required this.recipe, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: context.onPrimary,
          border: Border.all(
            color: context.border,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CustomNetworkImage(imageUrl: recipe.imageUrl),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.primary,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: SvgPicture.asset(
                            "assets/icons/Plus.svg",
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              AppColors.kWhite,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        textAlign: TextAlign.start,
                        style: context.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
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
                            recipe.calories,
                            textAlign: TextAlign.start,
                            style: context.smallDescription,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
