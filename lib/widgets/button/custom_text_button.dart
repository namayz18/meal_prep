import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.title,
    this.onPress,
  }) : super(key: key);

  final String title;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onPress,
        child: Text(title, style: context.textButton),
      ),
    );
  }
}
