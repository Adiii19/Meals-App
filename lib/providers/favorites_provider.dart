import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>>{

FavoriteMealsNotifier():super([]);

bool togglefavoritestatus(Meal meal)
{
     final mealIsFavorite=state.contains(meal);

     if(mealIsFavorite)
     {
          state=state.where((m) => m.id!=meal.id).toList();
          return false;
}        
     else
     {
      state=[...state,meal];
      return true;
     }


}

}





final favoriteMEalsProvider =StateNotifierProvider<FavoriteMealsNotifier,List<Meal>>((ref){
    return 
      FavoriteMealsNotifier();
}

);