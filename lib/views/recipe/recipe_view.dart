import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/widgets/button/custom_back_button.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';
import 'package:meal_prep/widgets/text/custom_sub_heading_text.dart';
import 'package:meal_prep/widgets/widget/custom_network_image.dart';

class RecipeView extends StatefulWidget {
  final Recipe recipe;
  const RecipeView({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
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
    Recipe recipe = widget.recipe;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              AnimatedContainer(
                height: _imageHeight,
                duration: const Duration(milliseconds: 300),
                child: CustomNetworkImage(
                  imageUrl: recipe.imageUrl,
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
              padding: EdgeInsets.zero,
              controller: _scrollController,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomHeadingText(title: recipe.name),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/icons/watch.svg",
                                width: 18,
                                height: 18,
                                colorFilter: ColorFilter.mode(
                                  context.primary,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                recipe.duration,
                                style: context.description,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // const SizedBox(height: 30),
                    // CustomButton(title: 'Add To Meal Plan', onPress: () {}),
                    const SizedBox(height: 30),
                    const CustomSubHeadingText(title: 'Nutrition per portion'),
                    const SizedBox(height: 16),
                    nutritionWidget(context, recipe.nutritions),
                    const SizedBox(height: 30),
                    const CustomSubHeadingText(title: 'Ingredients'),
                    const SizedBox(height: 16),
                    nutritionWidget(context, recipe.ingredients),
                    const SizedBox(height: 30),
                    const CustomSubHeadingText(title: 'How to make'),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: recipe.steps.length,
                        itemBuilder: (context, index) {
                          final step = recipe.steps[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                step,
                                style: context.description,
                              ),
                              const SizedBox(height: 16.0),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget getKeywordItem(BuildContext context, List<String> keywords) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: SizedBox(
      child: Wrap(
        direction: Axis.horizontal,
        children: getKeywordListings(context, keywords),
      ),
    ),
  );
}

List<Widget> getKeywordListings(BuildContext context, List<String> keywords) {
  List<Widget> listings = [];
  for (int i = 0; i < keywords.length; i++) {
    listings.add(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          color: context.onPrimary,
          border: Border.all(
            color: context.border,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Text(
          keywords[i],
          style: context.description,
        ),
      ),
    );
  }
  return listings;
}

Widget nutritionWidget(BuildContext context, List<dynamic> items) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
    child: Container(
      padding: const EdgeInsets.all(8.0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: context.onPrimary,
        border: Border.all(
          color: context.border,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      item.name,
                      style: context.description,
                    ),
                    const Spacer(),
                    Text(
                      item.quantity,
                      style: context.smallDescription,
                    ),
                  ],
                ),
                index == items.length - 1
                    ? const SizedBox()
                    : Column(
                        children: [
                          const SizedBox(height: 8),
                          Container(
                            height: 1,
                            color: context.border,
                          )
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
