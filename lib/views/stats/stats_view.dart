import 'package:flutter/material.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';

class StatsView extends StatefulWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  State<StatsView> createState() => _StatsViewState();
}

class _StatsViewState extends State<StatsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          SizedBox(height: 16),
          CustomHeadingText(title: 'Statistics'),
        ],
      ),
    );
  }
}
