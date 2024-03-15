import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onPress;

  const CustomIconButton({
    Key? key,
    required this.icon,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPress,
      icon: SvgPicture.asset(
        icon,
        width: 30,
        height: 30,
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPress;

  const CustomBackButton({
    Key? key,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButton(
          icon: 'assets/icons/Arrow_Left.svg',
          onPress: onPress,
        ),
        const Spacer(),
      ],
    );
  }
}
