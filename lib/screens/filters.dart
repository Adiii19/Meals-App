import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FilterScreen extends ConsumerWidget{



      @override
  Widget build(BuildContext context,WidgetRef ref) {
    
        final activefilters=ref.watch(filtersprovider);

    return
       Scaffold(
            appBar: AppBar(
              title: Text('Your Filters'),
            ),
            body: 
            

              Column(
                children: [
                  SwitchListTile(value:activefilters[Filter.glutenFree]!, onChanged: (isChecked){
                    ref.read(filtersprovider.notifier).setFilter(Filter.glutenFree, isChecked);
                  },
                  title: Text('Gluten-Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color:Theme.of(context).colorScheme.onBackground
                  ),),
                  subtitle: Text("Only include gluten-free meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                  ),),
                  activeColor: Colors.green,
                  contentPadding: EdgeInsets.only(left:34,right:22),
                  ),
                  SwitchListTile(value: activefilters[Filter.lactoseFree]!, onChanged: (isChecked){
                   ref.read(filtersprovider.notifier).setFilter(Filter.lactoseFree, isChecked);
                  },
                  title: Text('Lactose-Free',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color:Theme.of(context).colorScheme.onBackground
                  ),),
                  subtitle: Text("Only include lactose-free meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                  ),),
                  activeColor: Colors.green,
                  contentPadding: EdgeInsets.only(left:34,right:22),
                  ),
                  SwitchListTile(value: activefilters[Filter.vegetarian]!, onChanged: (isChecked){
                    ref.read(filtersprovider.notifier).setFilter(Filter.vegetarian, isChecked);
                  },
                  title: Text('Vegetarian',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color:Theme.of(context).colorScheme.onBackground
                  ),),
                  subtitle: Text("Only include vegetarian meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                  ),),
                  activeColor: Colors.green,
                  contentPadding: EdgeInsets.only(left:34,right:22),
                  ),
                  SwitchListTile(value: activefilters[Filter.vegan]!, onChanged: (isChecked){
                    ref.read(filtersprovider.notifier).setFilter(Filter.vegan, isChecked);
                  },
                  title: Text('Vegan',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color:Theme.of(context).colorScheme.onBackground
                  ),),
                  subtitle: Text("Only include vegan  meals",style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground
                  ),),
                  activeColor: Colors.green,
                  contentPadding: EdgeInsets.only(left:34,right:22),
                  )
                ],
              ),
       );
       
  }

}