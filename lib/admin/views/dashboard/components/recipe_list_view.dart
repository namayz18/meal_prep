import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/core/extensions/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:meal_prep/models/recipe.dart';

class RecipeListView extends StatelessWidget {
  final List<Recipe> recipeList;
  final void Function(Recipe) handleEdit;
  final void Function(Recipe) handleDelete;

  const RecipeListView({
    Key? key,
    required this.recipeList,
    required this.handleEdit,
    required this.handleDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: context.onPrimary,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: DataTable(
        columnSpacing: 20.0,
        // minWidth: 600,
        columns: const [
          DataColumn(
            label: Text("Name"),
          ),
          DataColumn(
            label: Text("Categories"),
          ),
          DataColumn(
            label: Text("Types"),
          ),
          DataColumn(
            label: Text(""),
          ),
        ],
        rows: List.generate(
          recipeList.length,
          (index) => recipeDataRow(
            context,
            recipeList[index],
            handleEdit,
            handleDelete,
          ),
        ),
      ),
    );
  }
}

DataRow recipeDataRow(
  BuildContext context,
  Recipe recipe,
  Function(Recipe) onEdit,
  Function(Recipe) onDelete,
) {
  return DataRow(
    cells: [
      DataCell(Text(
        recipe.name,
        style: context.description,
        maxLines: 1,
      )),
      DataCell(Text(
        recipe.category,
        style: context.description,
        maxLines: 1,
      )),
      DataCell(Text(
        recipe.types.join(', '),
        style: context.description,
        maxLines: 1,
      )),
      DataCell(Row(
        children: [
          TextButton(
            onPressed: () {
              onEdit(recipe);
            },
            child: const Text(
              "Edit",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          TextButton(
            onPressed: () {
              onDelete(recipe);
            },
            child: const Text(
              "Delete",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
        ],
      )),
    ],
  );
}
