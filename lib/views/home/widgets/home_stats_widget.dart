import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HomeStatsWidget extends StatelessWidget {
  const HomeStatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: context.onPrimary,
            border: Border.all(
              color: context.border,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: context.border,
                blurRadius: 5,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nutritions',
                    style: context.title,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Text(
                          'Carbs',
                          style: context.description,
                        ),
                      ),
                      LinearPercentIndicator(
                        width: 100.0,
                        lineHeight: 8.0,
                        percent: 0.5,
                        backgroundColor: context.border,
                        progressColor: Colors.blue,
                        barRadius: const Radius.circular(5),
                      ),
                      Text(
                        '0 /311 g',
                        style: context.smallDescription,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Text(
                          'Protein',
                          style: context.description,
                        ),
                      ),
                      LinearPercentIndicator(
                        width: 100.0,
                        lineHeight: 8.0,
                        percent: 0.5,
                        backgroundColor: context.border,
                        progressColor: Colors.red,
                        barRadius: const Radius.circular(5),
                      ),
                      Text(
                        '0 /311 g',
                        style: context.smallDescription,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Text(
                          'Fat',
                          style: context.description,
                        ),
                      ),
                      LinearPercentIndicator(
                        width: 100.0,
                        lineHeight: 8.0,
                        percent: 0.5,
                        backgroundColor: context.border,
                        progressColor: Colors.orange,
                        barRadius: const Radius.circular(5),
                      ),
                      Text(
                        '0 /311 g',
                        style: context.smallDescription,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    'Calories',
                    style: context.title,
                  ),
                  const SizedBox(height: 8),
                  CircularPercentIndicator(
                    radius: 40.0,
                    lineWidth: 5.0,
                    percent: 0.1,
                    center: SizedBox(
                      height: 40,
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "0",
                              style: context.smallDescription,
                            ),
                            Text(
                              "of 2000",
                              style: context.smallDescription,
                            ),
                          ],
                        ),
                      ),
                    ),
                    backgroundColor: context.border,
                    progressColor: Colors.green,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
