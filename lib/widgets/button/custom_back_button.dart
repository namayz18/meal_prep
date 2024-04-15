import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';

class CustomBackButton extends StatelessWidget {
  final void Function() onPressed;
  const CustomBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: context.buttonColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: context.onPrimary.withOpacity(0.2),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ]),
          child: SvgPicture.asset('assets/icons/Arrow_Left.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                context.onPrimary,
                BlendMode.srcIn,
              )),
        ),
      ),
    );
  }
}
