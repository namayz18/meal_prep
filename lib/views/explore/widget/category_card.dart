import 'package:flutter/material.dart';
import 'package:meal_prep/core/extensions/device_size.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                context.isMobile ? 4 : 6, // number of items in each row
            mainAxisSpacing: 16.0, // spacing between rows
            crossAxisSpacing: 0.0, // spacing between columns
          ),
          // padding around the grid

          itemCount: categoryList.length, // total number of items
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                            'assets/images/category/${categoryList[index].image}'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  categoryList[index].name,
                  style: context.subTitle,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        )
      ],
    );
  }
}
