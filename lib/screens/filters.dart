import 'package:flutter/material.dart';

enum Filter{
glutenFree
,lactoseFree,
vegetarian,
vegan
}



class FilterScreen extends StatefulWidget{

  FilterScreen({super.key,required this.currentfilters});

  final Map<Filter,bool>currentfilters;

    @override
  State<FilterScreen> createState() {
    
      return _FilterScreen();

  }

}

class _FilterScreen extends State<FilterScreen>
{
  var glutenfreeset=false;
  var lactosefreeset=false;
  var vegetarianfreeset=false;
  var veganfreeset=false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    glutenfreeset=widget.currentfilters[Filter.glutenFree]!;
    lactosefreeset=widget.currentfilters[Filter.lactoseFree]!;
    veganfreeset=widget.currentfilters[Filter.vegetarian]!;
    veganfreeset=widget.currentfilters[Filter.vegan]!;

  }

      @override
  Widget build(BuildContext context) {
    
    return
       Scaffold(
            appBar: AppBar(
              title: Text('Your Filters'),
            ),
            body: PopScope(
              canPop:false,
              onPopInvoked: (didPop) {
                if(didPop)return
                Navigator.of(context).pop({
              Filter.glutenFree: glutenfreeset,
              Filter.lactoseFree: lactosefreeset,
              Filter.vegetarian: vegetarianfreeset,
              Filter.vegan: veganfreeset
            }
              
            );
                
             },

              child: Column(
                children: [
                  SwitchListTile(value: glutenfreeset, onChanged: (isChecked){
                    setState(() {
                      glutenfreeset=isChecked;
                    });
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
                  SwitchListTile(value: lactosefreeset, onChanged: (isChecked){
                    setState(() {
                      lactosefreeset=isChecked;
                    });
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
                  SwitchListTile(value: vegetarianfreeset, onChanged: (isChecked){
                    setState(() {
                      vegetarianfreeset=isChecked;
                    });
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
                  SwitchListTile(value: veganfreeset, onChanged: (isChecked){
                    setState(() {
                      veganfreeset=isChecked;
                    });
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
            ),
       );
  }

}