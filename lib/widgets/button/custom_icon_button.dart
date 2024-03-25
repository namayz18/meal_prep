import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPress;
  final Color? color;

  const CustomIconButton({
    Key? key,
    required this.icon,
    this.onPress,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: SvgPicture.asset(icon,
          width: 30,
          height: 30,
          colorFilter: ColorFilter.mode(
            color ?? context.secondary,
            BlendMode.srcIn,
          )),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPress;
  final Color? color;

  const CustomBackButton({
    Key? key,
    this.onPress,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: 'assets/icons/Arrow_Left.svg',
          onPress: onPress,
          color: color,
        ),
        const Spacer(),
      ],
    );
  }
}
