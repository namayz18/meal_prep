import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';

Widget nextButton(
    BuildContext context, bool isDisabled, void Function()? onPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: TextButton(
      style: TextButton.styleFrom(
        maximumSize: const Size(120, 50),
        foregroundColor: context.secondary,
        backgroundColor: isDisabled ? context.border : context.primary,
        textStyle: context.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: isDisabled ? null : onPressed,
      child: Center(
        child: Text('Next', style: context.button),
      ),
    ),
  );
}
