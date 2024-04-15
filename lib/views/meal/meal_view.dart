import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/plan.dart';
import 'package:meal_prep/utils.dart';
import 'package:meal_prep/views/meal/controller/meal_view_controller.dart';
import 'package:meal_prep/views/meal/view/active_plan_view.dart';
import 'package:meal_prep/views/meal/view/plan_view.dart';
import 'package:meal_prep/widgets/text/custom_app_bar_text.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';
import 'package:meal_prep/widgets/widget/custom_network_image.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MealView extends StatefulWidget {
  const MealView({Key? key}) : super(key: key);

  @override
  State<MealView> createState() => _MealViewState();
}

class _MealViewState extends State<MealView> {
  final MealViewController _controller = MealViewController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const CustomAppBarText(title: 'Meal Plans'),
            Expanded(
              child: ListView(
                children: [
                  _controller.getActivePlan() != null
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const CustomHeadingText(title: 'Active Meal Plan'),
                            const SizedBox(height: 16),
                            activeMealView(
                              context,
                              _controller.getActivePlan()!,
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ActivePlanView(
                                      activePlan: _controller.getActivePlan()!,
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        )
                      : const SizedBox(height: 0),
                  const SizedBox(height: 16),
                  const CustomHeadingText(title: 'Explore Meal Plans'),
                  const SizedBox(height: 16),
                  explorePlansWidget(context, _controller),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget explorePlansWidget(BuildContext context, MealViewController controller) {
  final Future<List<Plan>> planList = controller.getMealPlans();
  return FutureBuilder<List<Plan>>(
    future: planList,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else if (snapshot.data == null) {
        return const Center(child: Text('No recipes found'));
      } else {
        final plans = snapshot.data ?? [];
        return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: plans.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: mealView(
                context,
                plans[index],
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlanView(
                        plan: plans[index],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      }
    },
  );
}

Widget mealView(BuildContext context, Plan plan, void Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: context.onPrimary,
          border: Border.all(
            color: context.border,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: [
            BoxShadow(
              color: context.border,
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: CustomNetworkImage(
                      imageUrl: plan.imageUrl,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getTotalDays(plan.totalDays),
                              style: context.heading),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(plan.title, style: context.subHeading),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            plan.description,
                            style: context.description,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 0,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget activeMealView(
  BuildContext context,
  ActivePlan activePlan,
  void Function() onTap,
) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: context.onPrimary,
          border: Border.all(
            color: context.border,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
          boxShadow: [
            BoxShadow(
              color: context.border,
              blurRadius: 5,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: CustomNetworkImage(
                      imageUrl: activePlan.imageUrl,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getTotalDays(activePlan.totalDays),
                              style: context.heading),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(activePlan.title, style: context.subHeading),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            activePlan.description,
                            style: context.description,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 0,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: context.onPrimary,
                          border: Border.all(
                            color: context.border,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: context.border,
                              blurRadius: 5,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            '${activePlan.completedDays} / ${activePlan.totalDays} Days',
                            style: context.title,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: LinearPercentIndicator(
                          lineHeight: 8.0,
                          percent:
                              activePlan.completedDays / activePlan.totalDays,
                          backgroundColor: context.border,
                          progressColor: Colors.blue,
                          barRadius: const Radius.circular(5),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
