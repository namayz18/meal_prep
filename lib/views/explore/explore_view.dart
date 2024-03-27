import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:meal_prep/models/recipe.dart';
import 'package:meal_prep/controllers/recipe_controller.dart';
import 'package:meal_prep/views/explore/widget/category_card.dart';
import 'package:meal_prep/views/recipe/recipe_view.dart';
import 'package:meal_prep/views/search/search_view.dart';
import 'package:meal_prep/widgets/card/recipe_card.dart';
import 'package:meal_prep/views/explore/widget/saved_card.dart';
import 'package:meal_prep/widgets/text/custom_heading_text.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({Key? key}) : super(key: key);

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  final RecipeController _recipeController = RecipeController();

  final TextEditingController _searchController = TextEditingController();
  bool isEmpty = false;
  @override
  void initState() {
    super.initState();
    // Start listening to changes.
    _searchController.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    setState(() {});
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Row(
              children: [
                const CustomHeadingText(title: 'Meal Prep Ideas'),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'All',
                      style: context.subHeading,
                      textAlign: TextAlign.center,
                    ),
                    SvgPicture.asset(
                      "assets/icons/Down.svg",
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        context.buttonColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SearchView(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SvgPicture.asset(
                      "assets/icons/Search.svg",
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        context.buttonColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        SavedCard(
                          title: 'Favorites',
                          count: '0',
                        ),
                        SizedBox(width: 16),
                        SavedCard(
                          title: 'My recipe',
                          count: '0',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CategoryCard(),
                  const SizedBox(height: 30),
                  const CustomHeadingText(title: 'Latest Recipes'),
                  const SizedBox(height: 16),
                  latestRecipeWidget(context, _recipeController),
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

Widget latestRecipeWidget(BuildContext context, RecipeController controller) {
  final Future<List<Recipe>> recipeList = controller.getRecipes();
  return SizedBox(
    height: 200,
    child: FutureBuilder<List<Recipe>>(
      future: recipeList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.data == null) {
          return const Center(child: Text('No recipes found'));
        } else {
          final latestRecipes = snapshot.data ?? [];
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: latestRecipes.length > 5 ? 5 : latestRecipes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: index == 0
                    ? const EdgeInsets.only(left: 16.0, right: 4.0)
                    : const EdgeInsets.symmetric(horizontal: 8.0),
                child: RecipeCard(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RecipeView(
                            recipe: latestRecipes[index],
                          ),
                        ),
                      );
                    },
                    recipe: latestRecipes[index]),
              );
            },
          );
        }
      },
    ),
  );
}
