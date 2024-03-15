import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/device_size.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({Key? key}) : super(key: key);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  final Recipe recipe = Recipe(
    id: "1",
    name: "Chicken Noodle Soup",
    description: "Classic soup",
    duration: "45 minutes",
    serving: "4",
    calories: "450 kcal per serving",
    image:
        "https://www.budgetbytes.com/wp-content/uploads/2017/02/Homemade-Chicken-Noodle-Soup-ladle-e-768x576.jpg",
    ingredients: [
      Ingredient(name: "Noodle", quantity: "100g"),
      Ingredient(name: "Carrot", quantity: "50g"),
      Ingredient(name: "Onion", quantity: "50g"),
      Ingredient(name: "Celery", quantity: "50g"),
      Ingredient(name: "Garlic", quantity: "10g"),
      Ingredient(name: "Olive Oil", quantity: "20g"),
      Ingredient(name: "Salt", quantity: "5g"),
      Ingredient(name: "Pepper", quantity: "5g"),
      Ingredient(name: "Water", quantity: "500ml"),
    ],
    nutritions: [
      Nutrition(name: "Calories", quantity: "450kcal"),
      Nutrition(name: "Protein", quantity: "20g"),
      Nutrition(name: "Fat", quantity: "10g"),
      Nutrition(name: "Carbohydrate", quantity: "30g"),
      Nutrition(name: "Fiber", quantity: "5g"),
      Nutrition(name: "Sugar", quantity: "5g"),
      Nutrition(name: "Sodium", quantity: "500mg"),
      Nutrition(name: "Cholesterol", quantity: "50mg"),
      Nutrition(name: "Vitamin A", quantity: "1000IU"),
      Nutrition(name: "Vitamin C", quantity: "10mg"),
      Nutrition(name: "Calcium", quantity: "100mg"),
      Nutrition(name: "Iron", quantity: "5mg"),
    ],
    categories: [],
  );
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: context.height * 0.4,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        recipe.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: context.onPrimary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        CustomHeadingText(title: recipe.name),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            color: context.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: context.height * 0.6,
              decoration: BoxDecoration(
                color: context.onPrimary,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/watch.svg",
                          width: 20,
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            context.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          recipe.duration,
                          style: context.title,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
