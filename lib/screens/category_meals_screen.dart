import 'package:flutter/material.dart';
import 'package:flutter_app55/dummy_data.dart';
import 'package:flutter_app55/models/meal.dart';
import 'package:flutter_app55/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    displayMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
  }

  @override
  void removeM(String mealId) {
    setState(() {
      displayMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeals[index].id,
            imageUrl: displayMeals[index].imageUrl,
            title: displayMeals[index].title,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
          );
        },
        itemCount: displayMeals.length,
      ),
    );
  }
}
