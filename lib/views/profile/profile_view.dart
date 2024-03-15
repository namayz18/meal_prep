import 'package:flutter/material.dart';
import 'package:meal_prep/views/profile/controller/profile_controller.dart';
import 'package:meal_prep/views/profile/widgets/account_widget.dart';
import 'package:meal_prep/views/profile/widgets/support_widget.dart';
import 'package:meal_prep/views/profile/widgets/profile_widget.dart';
import 'package:meal_prep/views/profile/widgets/settings_widget.dart';
import 'package:meal_prep/widgets/button/custom_button.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ProfileController _controller = ProfileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _controller.isAccountEmpty()
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: CustomButton(
                      title: 'Log in',
                      onPress: () => {
                        setState(() {
                          _controller.onPressLogin();
                        })
                      },
                    ),
                  )
                : AccountWidget(
                    account: _controller.getAccountDetail(),
                  ),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: CustomHeadingText(title: 'Profile'),
            ),
            ProfileWidget(),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: CustomHeadingText(title: 'Settings'),
            ),
            SettingsWidget(),
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: CustomHeadingText(title: 'Support'),
            ),
            SupportWidget(),
            const SizedBox(height: 30),
            _controller.isAccountEmpty()
                ? const SizedBox(height: 0)
                : Column(
                    children: [
                      CustomButton(
                        title: 'Sign out',
                        onPress: () => {
                          setState(() {
                            _controller.onPressSignOut();
                          })
                        },
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
