import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meal_providers.dart';

enum Filter{
glutenFree
,lactoseFree,
vegetarian,
vegan
}


class FiltersNotifier extends  StateNotifier<Map<Filter,bool>>
{
   FiltersNotifier():super({

            Filter.glutenFree:false,
            Filter.lactoseFree:false,
            Filter.vegetarian:false,
            Filter.vegan:false
            
       });

void setFilter(Filter filter,bool isActive)
{
    
      state={
            ...state,
            filter:isActive
               };

}

void setFilters(Map<Filter,bool>chosenfilters)
   {
   
   state=chosenfilters;

}
}
final filtersprovider=StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>((ref){
  return 
      FiltersNotifier();
});


final filteredmealsprovider=Provider((ref) {
    final meals=ref.watch(mealsProvider);
    final activefilters=ref.watch(filtersprovider);


return meals.where((meal){
    
    if(activefilters[Filter.glutenFree]!&&!meal.isGlutenFree)
    {
      return false;
    }

    if(activefilters[Filter.lactoseFree]!&&!meal.isLactoseFree)
    {
      return false;
    }

    if(activefilters[Filter.vegetarian]!&&!meal.isVegetarian)
    {
      return false;
    }

    if(activefilters[Filter.vegan]!&&!meal.isVegan)
    {
      return false;
    }
            return true;

    }
).toList();

});