import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/plan.dart';
import 'package:meal_prep/utils.dart';
import 'package:meal_prep/views/meal/controller/meal_view_controller.dart';
import 'package:meal_prep/widgets/button/custom_back_button.dart';
import 'package:meal_prep/widgets/button/custom_button.dart';
import 'package:meal_prep/widgets/text/custom_display_text.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';
import 'package:meal_prep/widgets/widget/custom_network_image.dart';

class ActivePlanView extends StatefulWidget {
  final ActivePlan activePlan;
  const ActivePlanView({super.key, required this.activePlan});

  @override
  State<ActivePlanView> createState() => _ActivePlanViewState();
}

class _ActivePlanViewState extends State<ActivePlanView> {
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
          _imageHeight = 100;
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
    ActivePlan activePlan = widget.activePlan;
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
                    imageUrl: activePlan.imageUrl,
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
                      CustomHeadingText(
                          title: getTotalDays(activePlan.totalDays)),
                      const SizedBox(height: 16.0),
                      CustomDisplayText(title: activePlan.title),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          activePlan.description,
                          style: context.description,
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: activePlan.totalDays,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Day ${index + 1}',
                                        style: context.title,
                                        maxLines: 1,
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
                                )),
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
                title: 'Cancel Plan',
                onPress: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
