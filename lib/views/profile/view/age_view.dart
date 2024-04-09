import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/views/profile/widgets/next_button.dart';
import 'package:meal_prep/widgets/text/custom_display_text.dart';
import 'package:meal_prep/widgets/text/custom_title_text.dart';
import 'package:meal_prep/widgets/widget/custom_date_picker.dart';

class AgeView extends StatelessWidget {
  final DateTime minDate;
  final DateTime maxDate;
  final int? selectedAge;
  final DateTime selectedDate;
  final void Function(DateTime) onPickerSelected;
  final void Function()? onPressedNext;
  const AgeView({
    Key? key,
    required this.minDate,
    required this.maxDate,
    required this.selectedAge,
    required this.selectedDate,
    required this.onPickerSelected,
    required this.onPressedNext,
  }) : super(key: key);

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
          const Spacer(),
          Text(
            "$selectedAge years",
            style: context.display?.copyWith(fontSize: 40),
          ),
          const Spacer(),
          nextButton(context, selectedAge?.isNaN ?? true, onPressedNext),
          const SizedBox(
            height: 16.0,
          ),
          datePicker(
            context,
            minDate,
            maxDate,
            selectedDate,
            onPickerSelected,
          )
        ],
      ),
    );
  }
}

Widget datePicker(
  BuildContext context,
  DateTime minDate,
  DateTime maxDate,
  DateTime selectedDate,
  void Function(DateTime) onPickerSelected,
) {
  return SizedBox(
    height: 300,
    child: CustomDatePicker(
      itemExtent: 50,
      minDate: minDate,
      maxDate: maxDate,
      selectedDate: selectedDate,
      selectionOverlay: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
      selectedStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
      unselectedStyle: TextStyle(
        color: Colors.grey[800],
        fontSize: 18,
      ),
      disabledStyle: TextStyle(
        color: Colors.grey[400],
        fontSize: 18,
      ),
      onSelectedItemChanged: onPickerSelected,
    ),
  );
}
