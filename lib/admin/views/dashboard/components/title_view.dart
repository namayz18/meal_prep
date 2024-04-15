import 'package:flutter/material.dart';
import 'package:meal_prep/admin/controllers/admin_controller.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';

class TitleView extends StatelessWidget {
  final AdminController adminController;
  const TitleView({
    Key? key,
    required this.adminController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Dashboard",
              style: context.subDisplay,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0 * 1.5,
                  vertical: 16.0,
                ),
              ),
              onPressed: () {
                adminController.addPlan();
              },
              icon: const Icon(Icons.add),
              label: const Text("Add New"),
            ),
          ],
        ),
      ],
    );
  }
}
