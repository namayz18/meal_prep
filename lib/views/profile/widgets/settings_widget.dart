import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';

class SettingsWidget extends StatelessWidget {
  final List<String> _settingsList = [
    'Personal Details',
    'Notification',
    'Week Start',
    'Units',
    'Theme',
    'Language',
  ];

  SettingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: context.onPrimary,
          border: Border.all(
            color: context.border,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _settingsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        _settingsList[index],
                        style: context.title,
                      ),
                      const Spacer(),
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
                  index == _settingsList.length - 1
                      ? const SizedBox()
                      : Column(
                          children: [
                            const SizedBox(height: 8),
                            Container(
                              height: 1,
                              color: context.border,
                            )
                          ],
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
