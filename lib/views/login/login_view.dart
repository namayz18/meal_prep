import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/views/main/main_view.dart';
import 'package:meal_prep/widgets/button/custom_back_button.dart';
import 'package:meal_prep/widgets/button/custom_text_button.dart';
import 'package:meal_prep/widgets/button/custom_icon_text_button.dart';
import 'package:meal_prep/widgets/button/custom_button.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';
import 'package:meal_prep/widgets/textfield/custom_textfield.dart';
import 'package:meal_prep/widgets/textfield/password_textfield.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    emailController.addListener(_printLatestValue);
    passwordController.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    setState(() {});
  }

  void _showPassword(BuildContext context) {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomBackButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(height: 16),
          const CustomHeadingText(title: 'Let\'s get started.'),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'login to continue to use app.',
              style: context.subTitle,
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Email',
              style: context.title,
            ),
          ),
          const SizedBox(height: 4),
          CustomTextField(controller: emailController),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Password',
              style: context.title,
            ),
          ),
          const SizedBox(height: 4),
          PasswordTextField(
            controller: passwordController,
            passwordVisible: _passwordVisible,
            onTap: _showPassword,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Spacer(),
              CustomTextButton(
                title: 'Forgot Password?',
                onPress: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MainView(),
                    ),
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 30),
          CustomButton(
            title: 'Log in',
            onPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MainView(),
                ),
              );
            },
          ),
          const SizedBox(height: 30),
          Center(
            child: Text(
              'or continue with',
              style: context.subTitle,
            ),
          ),
          const SizedBox(height: 30),
          const CustomIconTextButton(
            icon: "assets/icons/Google.svg",
            title: 'Log In with Google',
          ),
          const SizedBox(height: 16),
          const CustomIconTextButton(
            icon: "assets/icons/apple.svg",
            title: 'Log In with Apple',
          ),
          const SizedBox(height: 16),
          const CustomIconTextButton(
            icon: "assets/icons/Facebook.svg",
            title: 'Log In with Facebook',
          ),
        ],
      ),
    );
  }
}
