import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/models/plan.dart';
import 'package:meal_prep/utils.dart';
import 'package:meal_prep/views/meal/controller/meal_view_controller.dart';
import 'package:meal_prep/views/meal/widgets/plan_card_widget.dart';
import 'package:meal_prep/widgets/button/custom_back_button.dart';
import 'package:meal_prep/widgets/button/custom_button.dart';
import 'package:meal_prep/widgets/text/custom_display_text.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';
import 'package:meal_prep/widgets/widget/custom_network_image.dart';

class PlanView extends StatefulWidget {
  final Plan plan;
  const PlanView({super.key, required this.plan});

  @override
  State<PlanView> createState() => _PlanViewState();
}

class _PlanViewState extends State<PlanView> {
  final MealViewController _controller = MealViewController();
  final ScrollController _scrollController = ScrollController();
  double _imageHeight = 300;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_scrollController.hasClients) {
      if (_scrollController.offset > 0) {
        setState(() {
          _imageHeight = 200;
        });
      } else {
        setState(() {
          _imageHeight = 300;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Plan plan = widget.plan;
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Stack(
              children: [
                AnimatedContainer(
                  height: _imageHeight,
                  duration: const Duration(milliseconds: 300),
                  child: CustomNetworkImage(
                    imageUrl: plan.imageUrl,
                  ),
                ),
                SafeArea(
                  child: CustomBackButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                controller: _scrollController,
                padding: EdgeInsets.zero,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16.0),
                      CustomHeadingText(title: getTotalDays(plan.totalDays)),
                      const SizedBox(height: 16.0),
                      CustomDisplayText(title: plan.title),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          plan.description,
                          style: context.description,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: plan.recipeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: PlanCard(
                              recipe: plan.recipeList[index],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: CustomButton(
                  title: 'Start Plan', onPress: _controller.startPlan(plan)),
            ),
          ],
        ),
      ),
    );
  }
}
