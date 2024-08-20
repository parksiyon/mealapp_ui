import 'package:flutter/material.dart';
//import 'package:meals_app/screen/categories.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screen/tabs.dart';
//import 'package:meals_app/screen/meals.dart';
//import 'package:meals_app/data/dummy_data.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const TabsScreen()
        //CategoriesScreen(),
        //Meals(title: 'Select any category', meals: dummyMeals)
        );
  }
}
