import 'package:flutter/material.dart';

// ignore: camel_case_types
enum Filter {
  glutenFree,
  vegT,
  nonVeg,
}

class CustomFilter extends StatefulWidget {
  const CustomFilter({super.key});

  @override
  State<CustomFilter> createState() => _CustomFilterState();
}

// ignore: camel_case_types
class _CustomFilterState extends State<CustomFilter> {
  var filterChange = false;
  var nonVeg = false;
  var veg = false;

  Future<void> _handleBackButton() async {
    Navigator.of(context).pop(
      {
        Filter.glutenFree: filterChange,
        Filter.vegT: veg,
        Filter.nonVeg: nonVeg,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Your Filters'),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! < 0) {
            _handleBackButton();
          }
        },
        child: Column(
          children: [
            SwitchListTile(
              value: filterChange,
              onChanged: (isChecked) {
                setState(() {
                  filterChange = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: veg,
              onChanged: (isChecked) {
                setState(() {
                  veg = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: nonVeg,
              onChanged: (isChecked) {
                setState(() {
                  nonVeg = isChecked;
                });
              },
              title: Text(
                'Non Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
