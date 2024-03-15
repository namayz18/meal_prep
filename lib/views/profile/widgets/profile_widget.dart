import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';

class ProfileWidget extends StatelessWidget {
  final List<String> _profileList = [
    'Personal Details',
    'Allergies & dislikes',
    'Account',
  ];

  ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
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
          itemCount: _profileList.length,
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
                        _profileList[index],
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
                  index == _profileList.length - 1
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
