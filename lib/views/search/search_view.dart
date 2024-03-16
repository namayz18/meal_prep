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

// Widget searchGridResultView() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//     child: GridView.builder(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 3, // number of items in each row
//         mainAxisSpacing: 16.0, // spacing between rows
//         crossAxisSpacing: 8.0, // spacing between columns
//         childAspectRatio: 1 / 1.5, // width to height ratio
//       ),
//       // padding around the grid

//       itemCount: categoryList.length, // total number of items
//       itemBuilder: (context, index) {
//         return Container(
//           clipBehavior: Clip.hardEdge,
//           decoration: BoxDecoration(
//             color: context.onPrimary,
//             border: Border.all(
//               color: context.secondary.withOpacity(0.1),
//             ),
//             borderRadius: const BorderRadius.all(
//               Radius.circular(10),
//             ),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Flexible(
//                 child: Container(
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: AssetImage(
//                           'assets/images/category/${categoryList[index].image}'),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: SizedBox(
//                   height: 40,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         recipeList[index].name,
//                         textAlign: TextAlign.start,
//                         style: context.title,
//                         maxLines: 2,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     ),
//   );
// }

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
