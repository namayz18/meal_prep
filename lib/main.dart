import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_prep/core/config/firebase_options.dart';
import 'package:meal_prep/core/themes/app_theme.dart';
import 'package:meal_prep/services/local/local_user_service.dart';
import 'package:meal_prep/views/main/main_view.dart';
import 'package:meal_prep/views/welcome/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Initialize Hive
  await Hive.initFlutter();
  // Open the box
  await Hive.openBox('user');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final localUserService = LocalUserService();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Prep',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: localUserService.isUserEmpty()
          ? const WelcomeView()
          : const MainView(),
    );
  }
}
