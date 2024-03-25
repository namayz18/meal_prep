import 'package:flutter/material.dart';
import 'package:meal_prep/models/meal.dart';
import 'package:meal_prep/widgets/card/meal_small_card.dart';
import 'package:meal_prep/widgets/textfield/search_textfield.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController controller = TextEditingController();
  bool isEmpty = false;
  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    controller.addListener(_printLatestValue);
  }

  void _printLatestValue() {
    setState(() {});
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SearchTextField(
                controller: controller,
                placeholder: "Search for recipes...",
              ),
            ),
          )),
      body: ListView(children: [
        const SizedBox(height: 8),
        searchListResultView(),
      ]),
    );
  }
}

Widget searchListResultView() {
  return ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: mealList.length,
    itemBuilder: (BuildContext context, int index) {
      return MealSmallCard(
        meal: mealList[index],
        type: CardType.recipe,
      );
    },
  );
}
