import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/constants/color.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/views/profile/widgets/next_button.dart';
import 'package:meal_prep/widgets/text/custom_display_text.dart';
import 'package:meal_prep/widgets/text/custom_title_text.dart';

class GenderView extends StatelessWidget {
  final String? selectedGender;
  final void Function(String) onPickerSelected;
  final void Function()? onPressedNext;
  const GenderView({
    Key? key,
    this.selectedGender,
    required this.onPickerSelected,
    required this.onPressedNext,
  }) : super(key: key);

  Color genderColor(BuildContext context, String gender) {
    if (selectedGender == gender) {
      return context.primary;
    } else {
      return const Color(0xFF3A3A3C);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 8.0,
          ),
          const CustomDisplayText(title: 'Tell us about yourself!'),
          const SizedBox(
            height: 8.0,
          ),
          const CustomTitleText(
              title:
                  'To give you a better experience we need to know your gender'),
          const SizedBox(
            height: 30.0,
          ),
          GestureDetector(
            onTap: () {
              onPickerSelected('male');
            },
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: genderColor(
                    context,
                    'male',
                  ),
                  shape: BoxShape.circle),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Mars.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Male',
                        textAlign: TextAlign.center,
                        style: context.title?.copyWith(
                          color: AppColors.kWhite,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          GestureDetector(
            onTap: () {
              onPickerSelected('female');
            },
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: genderColor(
                    context,
                    'female',
                  ),
                  shape: BoxShape.circle),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/Mars.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Female',
                        textAlign: TextAlign.center,
                        style: context.title?.copyWith(
                          color: AppColors.kWhite,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60.0,
          ),
          nextButton(context, selectedGender?.isEmpty ?? true, onPressedNext),
        ],
      ),
    );
  }
}
