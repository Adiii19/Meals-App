import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';

const kinitialfilters={
  Filter.glutenFree:false,
  Filter.lactoseFree:false,
  Filter.vegetarian:false,
  Filter.vegan:false,
};


class TabsScreen extends StatefulWidget
{

     @override
  State<TabsScreen> createState() {
   return
        _TabsScreenState();
  }

}

class _TabsScreenState extends State<TabsScreen>
{
     int selectedPageIndex=0;

      void selectedPage(int index)
      {
       setState(() {
          selectedPageIndex=index;
       });
      }

final List<Meal> favoritemeals=[];
Map<Filter,bool> selectedfilters=kinitialfilters;

void showinfomessage(String message)
{

ScaffoldMessenger.of(context).clearSnackBars();
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

}

void togglefavoritemeals(Meal meal){

    final IsExisting=favoritemeals.contains(meal);
    if(IsExisting)
    {
      setState(() {
  favoritemeals.remove(meal);
  showinfomessage('Meal is not favorite!');
});
    }
    else
    {
      setState(() {
  favoritemeals.add(meal);
  showinfomessage('Meal is favorite!');
});
    }
}

void setScreen(String identifier) async
{
     Navigator.of(context).pop();
    if(identifier=='filters')
    {
          final result=await Navigator.of(context).push<Map<Filter, bool>>(
            MaterialPageRoute(builder: (ctx)=>
          FilterScreen(currentfilters: selectedfilters,)
          )
          );

         setState(() {
        selectedfilters=result??kinitialfilters;
        });
    }
 
}

  @override
  Widget build(BuildContext context) {

      final availableMeals=dummyMeals.where((meal){
    
    if(selectedfilters[Filter.glutenFree]!&&!meal.isGlutenFree)
    {
      return false;
    }

    if(selectedfilters[Filter.lactoseFree]!&&!meal.isLactoseFree)
    {
      return false;
    }

    if(selectedfilters[Filter.vegetarian]!&&!meal.isVegetarian)
    {
      return false;
    }

    if(selectedfilters[Filter.vegan]!&&!meal.isVegan)
    {
      return false;
    }
            return true;

    }
).toList();

    Widget activePage=CategoriesSCreen(ontogglefavoritemeals: togglefavoritemeals,availablemeals: availableMeals,);
    var activePageTitle='Categories';

    if(selectedPageIndex==1)
    {
      activePage=MealsScreen( meals: favoritemeals,ontogglefavoritemeals: togglefavoritemeals,);
      activePageTitle='Favorites';
    }

     return
             Scaffold(
         appBar: AppBar(
              title: Text(activePageTitle),
              ),
              
              drawer: MainDrawer(onselectScreen: setScreen,),
              
             body:activePage,
             bottomNavigationBar: 
             BottomNavigationBar(onTap: selectedPage
             ,currentIndex: selectedPageIndex,
             
             items: [BottomNavigationBarItem(icon: Icon(Icons.set_meal),label: 'Categories'),
             BottomNavigationBarItem(icon: Icon(Icons.star),label: 'Favorites')]),

             );

  }


}