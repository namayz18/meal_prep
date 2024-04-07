import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/recipe.dart';

Widget editRecipeView(
  BuildContext context,
  Recipe recipe,
  void Function() handleEditMode,
) {
  return Container(
    padding: const EdgeInsets.all(30),
    color: const Color(0xFF242634),
    child: ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    handleEditMode();
                  },
                  child: SvgPicture.asset(
                    width: 30,
                    height: 30,
                    'assets/icons/Arrow_Left.svg',
                    colorFilter: ColorFilter.mode(
                      context.buttonColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Text(
                  'Edit Recipe',
                  style: context.display,
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            recipeDetailView(context, recipe),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 8.0,
                ),
                decoration: BoxDecoration(
                  color: context.primary,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  'Update',
                  style: context.button,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget recipeDetailView(BuildContext context, Recipe recipe) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    decoration: BoxDecoration(
      color: context.onPrimary,
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextView(context, 'Name', recipe.name),
        customTextView(context, 'Description', recipe.description),
        customTextView(context, 'Duration', recipe.duration),
        customTextView(context, 'Calories', recipe.calories),
        customTextView(context, 'Calories', recipe.category),
        editSingleListView(context, 'Types', recipe.types),
        editIngredientView(context, 'Ingredients', recipe.ingredients),
        editNutritionView(context, 'Nutritions', recipe.nutritions),
      ],
    ),
  );
}

Widget customTextView(
  BuildContext context,
  String title,
  String value,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: context.title,
      ),
      const SizedBox(height: 16.0),
      customTextField(context, value, 'Enter details'),
      const SizedBox(height: 16.0),
    ],
  );
}

Widget customTextField(
  BuildContext context,
  String? value,
  String hintText,
) {
  return Container(
    width: 400,
    height: 50,
    padding: const EdgeInsets.symmetric(
      horizontal: 13,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: const Color(0xffE5E5E5),
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(5),
      ),
    ),
    child: TextFormField(
      initialValue: value,
      decoration: const InputDecoration(
        hintText: 'Enter details',
        hintStyle: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: Color(0xffB4B9C0),
        ),
        border: InputBorder.none,
      ),
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: Colors.black,
      ),
      autofocus: false,
    ),
  );
}

Widget editIngredientView(
  BuildContext context,
  String title,
  List<Ingredient> ingredients,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: context.title,
      ),
      const SizedBox(height: 16.0),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Name',
                  style: context.title,
                ),
                const SizedBox(width: 16.0),
                customTextField(
                    context, ingredients[index].name, 'Enter details'),
                const SizedBox(width: 16.0),
                Text(
                  'Quantity',
                  style: context.title,
                ),
                const SizedBox(width: 16.0),
                customTextField(
                    context, ingredients[index].quantity, 'Enter details'),
                const SizedBox(width: 30.0),
                SvgPicture.asset(
                  'assets/icons/Cancel.svg',
                  color: context.secondary,
                ),
              ],
            ),
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              'Name',
              style: context.title,
            ),
            const SizedBox(width: 16.0),
            customTextField(context, null, 'Enter details'),
            const SizedBox(width: 16.0),
            Text(
              'Quantity',
              style: context.title,
            ),
            const SizedBox(width: 16.0),
            customTextField(context, null, 'Enter details'),
            const SizedBox(width: 16.0),
            TextButton(
              onPressed: () {},
              child: const Text('Add'),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 16.0,
      ),
    ],
  );
}

Widget editNutritionView(
  BuildContext context,
  String title,
  List<Nutrition> nutritions,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: context.title,
      ),
      const SizedBox(height: 16.0),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: nutritions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Name',
                  style: context.title,
                ),
                const SizedBox(width: 16.0),
                customTextField(
                    context, nutritions[index].name, 'Enter details'),
                const SizedBox(width: 16.0),
                Text(
                  'Quantity',
                  style: context.title,
                ),
                const SizedBox(width: 16.0),
                customTextField(
                    context, nutritions[index].quantity, 'Enter details'),
                const SizedBox(width: 30.0),
                SvgPicture.asset(
                  'assets/icons/Cancel.svg',
                  color: context.secondary,
                ),
              ],
            ),
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              'Name',
              style: context.title,
            ),
            const SizedBox(width: 16.0),
            customTextField(context, null, 'Enter details'),
            const SizedBox(width: 16.0),
            Text(
              'Quantity',
              style: context.title,
            ),
            const SizedBox(width: 16.0),
            customTextField(context, null, 'Enter details'),
            const SizedBox(width: 16.0),
            TextButton(
              onPressed: () {},
              child: const Text('Add'),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 16.0,
      ),
    ],
  );
}

Widget editSingleListView(
    BuildContext context, String title, List<String> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: context.title,
      ),
      const SizedBox(height: 16.0),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                customTextField(context, items[index], 'Enter details'),
                const SizedBox(width: 30.0),
                SvgPicture.asset(
                  'assets/icons/Cancel.svg',
                  color: context.secondary,
                ),
              ],
            ),
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            customTextField(context, null, 'Enter details'),
            const SizedBox(width: 16.0),
            TextButton(
              onPressed: () {},
              child: const Text('Add'),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 16.0,
      ),
    ],
  );
}
