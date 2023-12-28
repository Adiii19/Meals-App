import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
   MainDrawer({super.key,required this.onselectScreen});

  final void Function(String identifier) onselectScreen;

   @override
  Widget build(BuildContext context) {
    
        return
            Drawer(
                  child: Column(
                    children: [
                      DrawerHeader(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Theme.of(context).colorScheme.primaryContainer,
                            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8)
                              ])
                        ),
                        
                        child: Row(
                          children: [
                            Icon(Icons.fastfood,size: 48,),
                            SizedBox(
                              width: 12,
                            ),
                            Text("Cooking Up!",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary
                            ),)
                          ],
                        )
                      ,
                      
                      ),
                      ListTile(
                        leading: Icon(Icons.restaurant,
                        size: 24,
                        color: Theme.of(context).colorScheme.onBackground,
                        ),
                        title: Text('Meals',style: 
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 24
                        )
                        ),
                        onTap: (){
                          onselectScreen('meals');
                        },

                        
                      ),
                      ListTile(
                        leading: Icon(Icons.settings
                        ,
                        size: 24,
                        color: Theme.of(context).colorScheme.onBackground,
                        ),
                        title: Text('Filter',style: 
                        Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 24
                        )
                        ),
                        onTap: (){
                          onselectScreen('filters');
                        },

                        
                      )

                    ],
                  ),
            );

  }



}