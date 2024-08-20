import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/model_meal.dart';
import 'package:meals_app/screen/meals.dart';
import 'package:meals_app/widget/category_grid.dart';
import 'package:meals_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFav, required this.availableMeals});
  final void Function(Meal meal) onToggleFav;
  final List<Meal> availableMeals;
  void selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
          onToggleFav: onToggleFav,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      children: [
        //availableCategories.map((category) => CategoryGrid(category: category)).toList(),
        for (final category in availableCategories)
          CategoryGrid(
            category: category,
            onSelectCategory: () {
              selectCategory(context, category);
            },
          )
      ],
    );
  }
}
