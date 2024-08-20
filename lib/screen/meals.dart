import 'package:flutter/material.dart';
import 'package:meals_app/models/model_meal.dart';
import 'package:meals_app/screen/meal_details_screen.dart';
import 'package:meals_app/widget/meal_items.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {super.key, this.title, required this.meals, required this.onToggleFav});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFav;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).pop;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsDetailsScreen(
          meal: meal,
          onToggleFav: onToggleFav,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Ops!...nothing here!",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 15),
          Text(
            'Try selecting a different category!',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
    );

    if (meals.isNotEmpty) {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItems(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: content,
    );
  }
}
