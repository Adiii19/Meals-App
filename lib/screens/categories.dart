import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';

class CategoriesSCreen extends StatelessWidget{

   CategoriesSCreen({super.key,required this.ontogglefavoritemeals,required this.availablemeals});

  final void Function(Meal meal)ontogglefavoritemeals;
  final List<Meal>availablemeals;

   void selectedcategory(BuildContext context,Category category)
   {
       final filteredmeals= availablemeals.where((meal)=>meal.categories.contains(category.id)).toList();

     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
     MealsScreen(title: category.title,meals: filteredmeals,ontogglefavoritemeals:ontogglefavoritemeals,)
     
     ));
    
   }

  @override
  Widget build(BuildContext context) {
   
    return
       Scaffold(
       
      body: GridView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20),
        children: [
          for(final category in availableCategories)
          CategoryGridItem(category: category,onSelectCategory:(){selectedcategory(context,category);},)

      ]),

       );

  }



}