import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';

class CustomIconTextButton extends StatelessWidget {
  final String icon;
  final String title;
  final bool isPrimary;
  final VoidCallback? onPress;

  const CustomIconTextButton({
    Key? key,
    required this.icon,
    required this.title,
    this.isPrimary = false,
    this.onPress,
  }) : super(key: key);

  Widget getIcon(BuildContext context) {
    if (isPrimary) {
      return SvgPicture.asset(
        icon,
        width: 18,
        height: 18,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      );
    } else {
      return SvgPicture.asset(
        icon,
        width: 18,
        height: 18,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: isPrimary ? context.onPrimary : context.secondary,
          backgroundColor: isPrimary ? context.primary : context.onPrimary,
          textStyle: context.button,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isPrimary ? context.primary : const Color(0xffE5E5E5),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: onPress,
        child: SizedBox(
          height: 40,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              getIcon(context),
              const SizedBox(width: 10),
              Text(
                title,
                style: isPrimary
                    ? context.title?.copyWith(color: Colors.white)
                    : context.title,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
