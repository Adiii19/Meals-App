import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';
import 'package:meals/models/category.dart';

class CategoriesSCreen extends StatefulWidget{

   CategoriesSCreen({super.key,required this.availablemeals});

  final List<Meal>availablemeals;

  @override
  State<CategoriesSCreen> createState() => _CategoriesSCreenState();
}

class _CategoriesSCreenState extends  State<CategoriesSCreen> with SingleTickerProviderStateMixin{

      late AnimationController animationController;
      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController=AnimationController(vsync: this,
    duration: Duration(milliseconds: 300),
    lowerBound: 0,
    upperBound: 1
    );
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

   void selectedcategory(BuildContext context,Category category)
   {
       final filteredmeals= widget.availablemeals.where((meal)=>meal.categories.contains(category.id)).toList();

     Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>
     MealsScreen(title: category.title,meals: filteredmeals)
     
     ));
    
   }

  @override
  Widget build(BuildContext context) {
   
    return
       Scaffold(
       
      body: AnimatedBuilder(animation: animationController,
      child: GridView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20),
        children: [
          for(final category in availableCategories)
          CategoryGridItem(category: category,onSelectCategory:(){selectedcategory(context,category);},)

      ]),
      
      
       builder:(context, child) =>
           SlideTransition(position: Tween(
            begin: Offset(0, 0.3),
            end: Offset(0, 0)
           ).animate(CurvedAnimation(parent: animationController, curve: Curves.easeInOut))
           
           ,child: child,)
        
        
      ,)

       );

  }
}