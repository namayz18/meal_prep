import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool isPrimary;
  final VoidCallback? onPress;

  const CustomButton({
    Key? key,
    required this.title,
    this.isPrimary = true,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        style: isPrimary
            ? TextButton.styleFrom(
                foregroundColor: context.secondary,
                backgroundColor:
                    isPrimary ? context.primary : context.onPrimary,
                textStyle: context.button,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              )
            : TextButton.styleFrom(
                foregroundColor: context.secondary,
                backgroundColor: context.onPrimary,
                textStyle: context.button,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color(0xffE5E5E5),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
        onPressed: onPress,
        child: SizedBox(
          height: 40,
          child: Center(
            child: Text(
              title,
              style: isPrimary ? context.button : context.textButton,
            ),
          ),
        ),
      ),
    );
  }
}
