import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetails extends StatelessWidget{
  MealDetails({super.key,required this.meal,required this.ontogglefavoritemeals});


final Meal meal;
final void Function(Meal meal)ontogglefavoritemeals;


  
   @override
  Widget build(BuildContext context) {
   
   return
        
     Scaffold(

        appBar: AppBar(title: Text(meal.title,style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: (){
            ontogglefavoritemeals(meal);
          }, icon:Icon(Icons.star))
        ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(meal.imageUrl),
              SizedBox(height: 5,),
              
            Text("Ingredients",style: Theme.of(context).textTheme.titleLarge!.copyWith(
             color: Theme.of(context).colorScheme.primary,
             fontWeight: FontWeight.bold
            ),),
              SizedBox(height: 5,),
          
              for(final ans in meal.ingredients)
              Text(ans,style: TextStyle(color: Colors.white),),
          
              SizedBox(height: 14,),
              Text("Steps",style: Theme.of(context).textTheme.titleLarge!.copyWith(
             color: Theme.of(context).colorScheme.primary,
             fontWeight: FontWeight.bold
            ),),
          
             for(final ans in meal.steps)
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
               child: Text(ans,style: TextStyle(color: Colors.white),textAlign:TextAlign.center,),
             ),
            
            ],
          ),
        )
        

     );


     }
}