import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/views/profile/widgets/next_button.dart';
import 'package:meal_prep/widgets/text/custom_display_text.dart';
import 'package:meal_prep/widgets/text/custom_title_text.dart';
import 'package:meal_prep/widgets/widget/custom_height_picker.dart';

class HeightView extends StatelessWidget {
  final int? selectedHeight;
  final void Function(int) onPickerSelected;
  final void Function()? onPressedNext;
  const HeightView({
    Key? key,
    required this.selectedHeight,
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
            "$selectedHeight cm",
            style: context.display?.copyWith(fontSize: 40),
          ),
          const Spacer(),
          nextButton(context, selectedHeight?.isNaN ?? true, onPressedNext),
          const SizedBox(
            height: 16.0,
          ),
          heightPicker(
            context,
            selectedHeight ?? 150,
            onPickerSelected,
          ),
        ],
      ),
    );
  }
}

Widget heightPicker(
  BuildContext context,
  int selectedHeight,
  void Function(int) onPickerSelected,
) {
  return SizedBox(
    height: 300,
    child: CustomHeightPicker(
      itemExtent: 50,
      selectedHeight: selectedHeight,
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
