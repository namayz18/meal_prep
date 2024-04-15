import 'package:flutter/material.dart';
import 'package:meal_prep/core/constants/color.dart';
import 'package:meal_prep/core/extensions/device_size.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/views/profile/profile_onboarding_view.dart';
import 'package:meal_prep/widgets/button/custom_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/launch.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Let\'s get started.',
                    style: context.display?.copyWith(
                      color: AppColors.kBlack,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Start your meal prep journey to a healthier life with us.',
                    style: context.subHeading?.copyWith(
                      color: AppColors.kBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  title: 'Get Started',
                  onPress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ProfileOnboardingView(),
                      ),
                    );
                  },
                ),
                SizedBox(height: context.bottomPadding),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
