import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';

class CustomDisplayText extends StatelessWidget {
  const CustomDisplayText({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: context.display,
          ),
        ],
      ),
    );
  }
}
