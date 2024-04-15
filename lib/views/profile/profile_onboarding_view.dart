import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/views/main/main_view.dart';
import 'package:meal_prep/views/profile/controller/profile_controller.dart';
import 'package:meal_prep/views/profile/view/age_view.dart';
import 'package:meal_prep/views/profile/view/gender_view.dart';
import 'package:meal_prep/views/profile/view/height_view.dart';
import 'package:meal_prep/views/profile/view/weight_view.dart';
import 'package:meal_prep/widgets/button/custom_back_button.dart';
import 'package:meal_prep/widgets/button/custom_text_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

enum _SettingType { gender, age, height, weight }

class ProfileOnboardingView extends StatefulWidget {
  const ProfileOnboardingView({super.key});

  @override
  State<ProfileOnboardingView> createState() => _ProfileOnboardingViewState();
}

class _ProfileOnboardingViewState extends State<ProfileOnboardingView> {
  final ProfileController _controller = ProfileController();
  late final DateTime _minDate;
  late final DateTime _maxDate;
  late DateTime? _selectedDate;
  late int? _selectedAge;
  late String? _selectedGender;
  late int? _selectedHeight;
  late int? _selectedWeight;
  late _SettingType _selectedType;
  final types = [
    _SettingType.gender,
    _SettingType.age,
    _SettingType.height,
    _SettingType.weight
  ];
  late double _progress;

  @override
  void initState() {
    super.initState();
    _selectedType = _SettingType.gender;
    _selectedGender = '';
    _selectedAge = 0;
    _selectedHeight = 150;
    _selectedWeight = 60;
    _progress = 0.25;
    final currentDate = DateTime.now();
    _minDate = DateTime(
      currentDate.year - 100,
      currentDate.month,
      currentDate.day,
    );
    _maxDate = DateTime(
      currentDate.year - 10,
      currentDate.month,
      currentDate.day,
    );
    _selectedDate = _maxDate;
  }

  void onPickerSelected(_SettingType type, value) {
    switch (type) {
      case _SettingType.gender:
        setState(() {
          _selectedGender = value;
        });
        break;
      case _SettingType.age:
        setState(() {
          _selectedDate = value;
        });
        break;
      case _SettingType.height:
        setState(() {
          _selectedHeight = value;
        });
        break;
      case _SettingType.weight:
        setState(() {
          _selectedWeight = value;
        });
        break;
    }
  }

  void onPressBack(BuildContext context) {
    if (_selectedType == types.first) {
      saveUserDetails();
      Navigator.of(context).pop();
      return;
    }
    setState(() {
      _progress -= 0.25;
      _selectedType = types[types.indexOf(_selectedType) - 1];
    });
  }

  void onSkip(BuildContext context) {
    onPickerSelected(_selectedType, null);
    onNextType(context);
  }

  void saveUserDetails() {
    _controller.saveUserDetails(
      _selectedGender,
      _selectedAge,
      _selectedHeight,
      _selectedWeight,
    );
  }

  void onNextType(BuildContext context) {
    if (_selectedType == types.last) {
      saveUserDetails();
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MainView(),
        ),
      );
      return;
    }
    setState(() {
      _progress += 0.25;
      _selectedType = types[types.indexOf(_selectedType) + 1];
    });
  }

  void calculateAge(DateTime selectedDate) {
    final age = DateTime.now().year - selectedDate.year;
    setState(() {
      _selectedAge = age;
    });
  }

  Widget settingTypeView(BuildContext context, _SettingType type) {
    switch (type) {
      case _SettingType.gender:
        return GenderView(
          selectedGender: _selectedGender,
          onPickerSelected: (gender) => {
            onPickerSelected(_SettingType.gender, gender),
          },
          onPressedNext: () {
            onNextType(context);
          },
        );
      case _SettingType.age:
        return AgeView(
          minDate: _minDate,
          maxDate: _maxDate,
          selectedAge: _selectedAge,
          selectedDate: _selectedDate ?? _maxDate,
          onPickerSelected: (value) => {
            onPickerSelected(_SettingType.age, value),
            calculateAge(value),
          },
          onPressedNext: () {
            onNextType(context);
          },
        );
      case _SettingType.height:
        return HeightView(
          selectedHeight: _selectedHeight,
          onPickerSelected: (value) => onPickerSelected(
            _SettingType.height,
            value,
          ),
          onPressedNext: () {
            onNextType(context);
          },
        );
      case _SettingType.weight:
        return WeightView(
          selectedWeight: _selectedWeight,
          onPickerSelected: (value) => onPickerSelected(
            _SettingType.weight,
            value,
          ),
          onPressedNext: () {
            onNextType(context);
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          navBar(
            context,
            () {
              onPressBack(context);
            },
            () {
              onSkip(context);
            },
            _progress,
          ),
          settingTypeView(context, _selectedType),
        ],
      ),
    ));
  }
}

Widget navBar(BuildContext context, void Function() onPressedBack,
    void Function() onPressedNext, double progress) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CustomBackButton(
        onPressed: onPressedBack,
      ),
      Expanded(
        child: LinearPercentIndicator(
          lineHeight: 8.0,
          percent: progress,
          backgroundColor: context.border,
          progressColor: context.primary,
          barRadius: const Radius.circular(5),
        ),
      ),
      CustomTextButton(title: 'Skip', onPress: onPressedNext),
    ],
  );
}
