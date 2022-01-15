import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import '../models/meal.dart';

class CategoriesMeal extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> _availableMeals;

  CategoriesMeal(this._availableMeals);

  @override
  _CategoriesMealState createState() => _CategoriesMealState();
}

class _CategoriesMealState extends State<CategoriesMeal> {
  String catTitle;
  List<Meal> categoryMeals;
  var _loadedInitData = false;
  @override
  void initState() {
    //....initstate won't work this case because of the usage of ModalRoute(ModalRoute will not work well if inside initstate)
    // final args =
    //   ModalRoute.of(context).settings.arguments as Map<String, String>;
    //catTitle = args['title'];
    //final catID = args['id'];
    //categoryMeals = DUMMY_MEALS.where((meal) {
    //return meal.categories.contains(catID);
    //}).toList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      catTitle = args['title'];
      final catID = args['id'];
      categoryMeals = widget._availableMeals.where((meal) {
        return meal.categories.contains(catID);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              affordability: categoryMeals[index].affordability,
              removeItem: _removeMeal,
            );
          },
          itemCount: categoryMeals.length,
        ));
  }
}
