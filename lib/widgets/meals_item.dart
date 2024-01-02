import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/screens/meal_details.dart';

class MealsItem extends StatelessWidget {
  MealsItem({super.key, required this.meal,required this.onselectedmeal});
  final Meal meal;
  final void Function(Meal meal)onselectedmeal;

  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordibilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

   

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onselectedmeal(meal);
        },
        child: Stack(
          children: [

            Hero(
              tag:meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                  color: Colors.black54,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              icon: Icons.timer_rounded,
                              label: '${meal.duration}min'),
                          SizedBox(
                            width: 20,
                          ),
                          MealItemTrait(
                              icon: Icons.work, label: complexityText),
                          SizedBox(
                            width: 20,
                          ),
                          MealItemTrait(
                              icon: Icons.attach_money_rounded,
                              label: affordibilityText),
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
