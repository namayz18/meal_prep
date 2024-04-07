import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/widgets/button/custom_text_button.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/Left.svg",
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    context.buttonColor,
                    BlendMode.srcIn,
                  ),
                ),
                CustomHeadingText(title: title),
                SvgPicture.asset(
                  "assets/icons/Right.svg",
                  width: 32,
                  height: 32,
                  colorFilter: ColorFilter.mode(
                    context.buttonColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomTextButton(
            title: 'Today',
            onPress: onPressCalendar,
          ),
        ],
      ),
    );
  }
}
