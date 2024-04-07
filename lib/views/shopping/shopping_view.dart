import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/meal.dart';
import 'package:meal_prep/views/shopping/controller/shopping_controller.dart';
import 'package:meal_prep/widgets/button/custom_icon_text_button.dart';
import 'package:meal_prep/widgets/button/custom_text_button.dart';
import 'package:meal_prep/widgets/card/meal_tile_card.dart';
import 'package:meal_prep/widgets/text/custom_app_bar_text.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({Key? key}) : super(key: key);

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                const CustomAppBarText(title: 'My Shopping List'),
                const Spacer(),
                CustomTextButton(title: 'Edit', onPress: () {}),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 16),
                  const CustomIconTextButton(
                    icon: 'assets/icons/Plus.svg',
                    title: 'Add Shopping Item',
                    isPrimary: true,
                  ),
                  const SizedBox(height: 16),
                  allIngredientsListWidget(context),
                  shoppingListWidget(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget shoppingListWidget(BuildContext context) {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: mealList.length,
    itemBuilder: (BuildContext context, int index) {
      return MealTileCard(
        meal: mealList[index],
      );
    },
  );
}

Widget allIngredientsListWidget(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 16.0,
        ),
        child: Row(
          children: [
            const SizedBox(width: 8),
            Container(
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
                  "assets/icons/Bag.svg",
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    context.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              'View All Ingredients',
              textAlign: TextAlign.start,
              style: context.title,
              maxLines: 1,
            ),
            const Spacer(),
            Text(
              '0',
              textAlign: TextAlign.start,
              style: context.description,
              maxLines: 1,
            ),
            const SizedBox(width: 8),
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
