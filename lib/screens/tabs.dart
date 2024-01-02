import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:riverpod/riverpod.dart';
import 'package:meals/providers/meal_providers.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget
{

     @override
  ConsumerState<TabsScreen> createState() {
   return
        _TabsScreenState();
  }

}

class _TabsScreenState extends ConsumerState<TabsScreen>
{
     int selectedPageIndex=0;

      void selectedPage(int index)
      {
       setState(() {
          selectedPageIndex=index;
       });
      }



void setScreen(String identifier) async
{
     Navigator.of(context).pop();
    if(identifier=='filters')
    {
          await Navigator.of(context).push<Map<Filter, bool>>(
            MaterialPageRoute(builder: (ctx)=>
          FilterScreen()
          )
          );

    }
 
}

  @override
  Widget build(BuildContext context) {
    

      final availableMeals=ref.watch(filteredmealsprovider);

    Widget activePage=CategoriesSCreen(availablemeals: availableMeals,);
    var activePageTitle='Categories';

    if(selectedPageIndex==1)
    {
      final favoritemeals=ref.watch(favoriteMEalsProvider);
      activePage=MealsScreen( meals: favoritemeals,);
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