import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/views/profile/widgets/next_button.dart';
import 'package:meal_prep/widgets/text/custom_display_text.dart';
import 'package:meal_prep/widgets/text/custom_title_text.dart';
import 'package:meal_prep/widgets/widget/custom_weight_picker.dart';

class WeightView extends StatelessWidget {
  final int? selectedWeight;
  final void Function(int) onPickerSelected;
  final void Function()? onPressedNext;
  const WeightView({
    Key? key,
    required this.selectedWeight,
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
            "$selectedWeight kg",
            style: context.display?.copyWith(fontSize: 40),
          ),
          const Spacer(),
          nextButton(context, selectedWeight?.isNaN ?? true, onPressedNext),
          const SizedBox(
            height: 16.0,
          ),
          weightPicker(
            context,
            selectedWeight ?? 60,
            onPickerSelected,
          ),
        ],
      ),
    );
  }
}

Widget weightPicker(
  BuildContext context,
  int selectedWeight,
  void Function(int) onPickerSelected,
) {
  return Container(
    height: 300,
    color: Colors.black,
    child: CustomWeightPicker(
      itemExtent: 50,
      selectedWeight: selectedWeight,
      selectionOverlay: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
      selectedStyle: context.display?.copyWith(color: Colors.white),
      unselectedStyle: context.title?.copyWith(color: Colors.white),
      disabledStyle: context.title?.copyWith(color: Colors.grey),
      onSelectedItemChanged: onPickerSelected,
    ),
  );
}
