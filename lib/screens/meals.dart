import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meals_item.dart';
class MealsScreen extends StatelessWidget{
 
 MealsScreen({ this.title,required this.meals,super.key});

  final String? title;
  final List<Meal> meals;

   void selectedmeal(BuildContext context,Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetails(
          meal: meal, 
          )
          
          
        ),
      );
    
  }

  @override
  Widget build(BuildContext context) {

    Widget content=Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
          Text("Uh oh..Nothing here",style: 
          Theme.of(context).textTheme.headlineLarge!.copyWith(
           color: Theme.of(context).colorScheme.onBackground
          )
          ,),
          SizedBox(height: 10,),
          Text("Try another category",style:Theme.of(context).textTheme.bodyLarge!.copyWith(
            color:Theme.of(context).colorScheme.onBackground
          ) ,)
        ],
             ),
      );
    
  
       
       if(meals.isNotEmpty)
       {
            content= ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx,index)=>MealsItem(meal: meals[index],onselectedmeal: (meal){
        selectedmeal(context, meal);
      },),
      );

       }

        if(title==null)
        {
          return
              content;
        }


     return Scaffold(
      appBar: AppBar(title: Text(title!),),
     
     body:content
     
     );


  }



}