import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

class MealDetails extends ConsumerWidget{
  MealDetails({super.key,required this.meal,});


final Meal meal;


  
   @override
  Widget build(BuildContext context,WidgetRef ref) {

   final favoritemeals=ref.watch(favoriteMEalsProvider);
   final isFavorite=favoritemeals.contains(meal);

   return
        
     Scaffold(

        appBar: AppBar(title: Text(meal.title,style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: (){
              final wasAdded=ref.read(favoriteMEalsProvider.notifier).togglefavoritestatus(meal);

              ScaffoldMessenger.of(context).clearSnackBars();
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(wasAdded?'Meal added as favorite!':'Meal removed!')));

          },
           icon:AnimatedSwitcher(duration: Duration(milliseconds: 300),
           child:Icon(isFavorite?Icons.star:Icons.star_border,key: ValueKey(isFavorite),),
           transitionBuilder: (child, animation) {
            return
                   RotationTransition(turns:Tween(begin: 0.8,end: 1.0).animate(animation),child: child,);
             
           }, ),
          )
        
        ]
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(child: Image.network(meal.imageUrl),tag: meal.id,),
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