import 'package:flutter/material.dart';
import 'package:meal_prep/views/home/controller/home_view_controller.dart';
import 'package:meal_prep/views/home/view/home_meal_category_view.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';
import 'package:meal_prep/widgets/widget/calendar_month_widget.dart';

class HomeMonthView extends StatelessWidget {
  final HomeViewController controller;
  const HomeMonthView({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const CalendarMonthWidget(),
      const SizedBox(height: 16),
      const CustomHeadingText(title: 'Meals'),
      const SizedBox(height: 8),
      HomeMealCategoryView(controller: controller),
      const SizedBox(height: 80),
    ]);
  }
}
