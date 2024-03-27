import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/views/home/controller/home_view_controller.dart';
import 'package:meal_prep/widgets/button/custom_icon_text_button.dart';

class AddMealWidget extends StatelessWidget {
  final HomeViewController controller;
  const AddMealWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'You can create your own meal plan for the day or week or get help from our meal AI.',
                style: context.description,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            CustomIconTextButton(
              icon: 'assets/icons/Plus.svg',
              title: 'Add Meal Plan',
              isPrimary: true,
              onPress: () {
                // controller.addMeal();
              },
            ),
          ],
        ),
      ),
    );
  }
}
