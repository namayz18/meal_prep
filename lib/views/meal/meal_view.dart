import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/widgets/button/custom_text_button.dart';
import 'package:meal_prep/widgets/text/custom_app_bar_text.dart';

class MealView extends StatefulWidget {
  const MealView({Key? key}) : super(key: key);

  @override
  State<MealView> createState() => _MealViewState();
}

class _MealViewState extends State<MealView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                CustomAppBarText(title: 'Meal Plans'),
                Spacer(),
                CustomTextButton(title: 'Create')
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 16),
                  mealView(
                    context,
                    'assets/images/meal1.jpg',
                  ),
                  const SizedBox(height: 16),
                  mealView(
                    context,
                    'assets/images/meal2.jpg',
                  ),
                  const SizedBox(height: 16),
                  mealView(
                    context,
                    'assets/images/meal3.jpg',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        heroTag: "btn2",
        onPressed: () {},
        backgroundColor: context.primary,
        foregroundColor: context.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget mealView(BuildContext context, String image) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
      height: 160,
      decoration: BoxDecoration(
        color: context.onPrimary,
        border: Border.all(
          color: context.border,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: context.border,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("2 Weeks", style: context.heading),
                  const SizedBox(
                    height: 8,
                  ),
                  Text("Clean Eating", style: context.subHeading),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                      "A meal plan based on fresh fruits, vegetables, lean proteins, and whole grains.",
                      style: context.description),
                ],
              ),
            ),
            const SizedBox(
              width: 0,
            )
          ],
        ),
      ),
    ),
  );
}
