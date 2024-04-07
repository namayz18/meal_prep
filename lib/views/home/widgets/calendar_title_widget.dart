import 'package:flutter/material.dart';
import 'package:meal_prep/widgets/button/custom_text_button.dart';
import 'package:meal_prep/widgets/text/custom_app_bar_text.dart';

class CalendarTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressCalendar;

  const CalendarTitleWidget({
    Key? key,
    required this.title,
    required this.onPressCalendar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomAppBarText(title: 'My Meals'),
        const Spacer(),
        CustomTextButton(
          title: 'Today',
          onPress: onPressCalendar,
        ),
      ],
    );
  }
}
