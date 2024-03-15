import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/widgets/button/custom_icon_text_button.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';

class AddMealWidget extends StatelessWidget {
  const AddMealWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.onPrimary,
          border: Border.all(
            color: context.border,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: context.border,
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomHeadingText(title: 'Plan Your Meals'),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'You can create a meal plan for the day or the week. You can also add your own meals and recipes or get help from our meal AI.',
                style: context.description,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30.0),
            const CustomIconTextButton(
              icon: 'assets/icons/Plus.svg',
              title: 'Add Meal Plan',
              isPrimary: true,
            ),
          ],
        ),
      ),
    );
  }
}
