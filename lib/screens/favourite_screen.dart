import 'package:flutter/material.dart';
import 'package:flutter_app55/models/meal.dart';
import 'package:flutter_app55/widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouriteScreen(this.favouriteMeals);

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Center(
        child: Text("You have no favourites yet - Start adding some!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            imageUrl: favouriteMeals[index].imageUrl,
            title: favouriteMeals[index].title,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
