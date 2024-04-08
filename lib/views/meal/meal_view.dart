import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/widgets/button/custom_text_button.dart';
import 'package:meal_prep/widgets/text/custom_app_bar_text.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
                  const CustomHeadingText(title: 'Active Meal Plans'),
                  const SizedBox(height: 16),
                  mealView(
                    context,
                    'assets/images/meal1.jpg',
                    isActive: true,
                  ),
                  const SizedBox(height: 16),
                  const CustomHeadingText(title: 'Explore Meal Plans'),
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
    );
  }
}

Widget mealView(BuildContext context, String image, {bool isActive = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Container(
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
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
            isActive
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 120,
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
                            child: Center(
                              child: Text(
                                '0 / 14 days',
                                style: context.title,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: LinearPercentIndicator(
                              lineHeight: 8.0,
                              percent: 0.1,
                              backgroundColor: context.border,
                              progressColor: Colors.blue,
                              barRadius: const Radius.circular(5),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : const SizedBox(
                    height: 0,
                  ),
          ],
        ),
      ),
    ),
  );
}
