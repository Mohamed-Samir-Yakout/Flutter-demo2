import 'package:flutter/material.dart';

import '../dummy_data.dart';

import '../widgets/meal_item.dart';

class CategoriesMeal extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String catId;
  // final String catTitle;

  // CategoriesMeal({this.catId, this.catTitle});
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = args['title'];
    final catID = args['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(catID);
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
                id: categoryMeals[index].id,
                title: categoryMeals[index].title,
                imaheUrl: categoryMeals[index].imageUrl,
                duration: categoryMeals[index].duration,
                complexity: categoryMeals[index].complexity,
                affordability: categoryMeals[index].affordability);
          },
          itemCount: categoryMeals.length,
        ));
  }
}
