import 'package:flutter/material.dart';
import 'package:meal_prep/admin/controllers/admin_controller.dart';
import 'package:meal_prep/admin/views/dashboard/components/edit_recipe_view.dart';
import 'package:meal_prep/admin/views/dashboard/components/header.dart';
import 'package:meal_prep/admin/views/dashboard/components/recipe_list_view.dart';
import 'package:meal_prep/admin/views/dashboard/components/title_view.dart';
import 'package:meal_prep/core/extensions/text_styles.dart';
import 'package:meal_prep/models/recipe.dart';

class DashboardView extends StatefulWidget {
  final AdminController adminController;

  const DashboardView({
    super.key,
    required this.adminController,
  });

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  Recipe? _selectedRecipe;
  bool _isEditMode = false;
  bool _isDeleteMode = false;

  void handleEdit(Recipe recipe) {
    setState(() {
      _isEditMode = true;
      _selectedRecipe = recipe;
    });
  }

  void handleDelete(Recipe recipe) {
    setState(() {
      _selectedRecipe = recipe;
    });
  }

  void handleEditMode() {
    setState(() {
      _isEditMode = false;
      _selectedRecipe = null;
    });
  }

  void handleDeleteMode() {
    setState(() {
      _isDeleteMode = false;
      _selectedRecipe = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            primary: false,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: 30.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          TitleView(
                            adminController: widget.adminController,
                          ),
                          const SizedBox(height: 16.0),
                          futureRecipeListView(
                            context,
                            widget.adminController,
                            handleEdit,
                            handleDelete,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          if (_selectedRecipe != null && _isEditMode)
            editRecipeView(
              context,
              _selectedRecipe!,
              handleEditMode,
            ),
        ],
      ),
    );
  }
}

Widget futureRecipeListView(
  BuildContext context,
  AdminController controller,
  Function(Recipe) handleEdit,
  Function(Recipe) handleDelete,
) {
  final Future<List<Recipe>> recipeList = controller.getRecipes();
  return SizedBox(
    child: FutureBuilder<List<Recipe>>(
      future: recipeList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
              child: Text(
            'Error: ${snapshot.error}',
            style: context.display,
          ));
        } else if (snapshot.data == null) {
          return RecipeListView(
            recipeList: const [],
            handleEdit: handleEdit,
            handleDelete: handleDelete,
          );
        } else {
          final recipes = snapshot.data ?? [];
          return RecipeListView(
            recipeList: recipes,
            handleEdit: handleEdit,
            handleDelete: handleDelete,
          );
        }
      },
    ),
  );
}
