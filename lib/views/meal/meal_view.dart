import 'package:flutter/material.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';

class MealView extends StatefulWidget {
  const MealView({Key? key}) : super(key: key);

  @override
  State<MealView> createState() => _MealViewState();
}

class _MealViewState extends State<MealView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          SizedBox(height: 16),
          CustomHeadingText(title: 'My Meals'),
        ],
      ),
    );
  }
}
