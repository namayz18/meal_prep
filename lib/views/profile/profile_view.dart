import 'package:flutter/material.dart';
import 'package:meal_prep/views/profile/controller/profile_controller.dart';
import 'package:meal_prep/views/profile/widgets/account_widget.dart';
import 'package:meal_prep/views/profile/widgets/support_widget.dart';
import 'package:meal_prep/views/profile/widgets/settings_widget.dart';
import 'package:meal_prep/widgets/text/custom_app_bar_text.dart';

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
            const SizedBox(height: 16),
            const CustomAppBarText(title: 'Profile'),
            AccountWidget(
              user: _controller.getUserDetail()!,
            ),
            const SizedBox(height: 16),
            SettingsWidget(),
            const SizedBox(height: 16),
            SupportWidget(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
