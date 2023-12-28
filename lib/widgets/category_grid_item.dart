import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/categories.dart';

class CategoryGridItem extends StatelessWidget{

CategoryGridItem({super.key,required this.category,required this.onSelectCategory});

final Category category;
final void Function()onSelectCategory;


@override
  Widget build(BuildContext context) {
   
   return
        InkWell(
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(20),
          onTap: onSelectCategory,
          child: Container( padding: EdgeInsets.all(16),
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(colors: [
                  category.color.withOpacity(0.45),
                  category.color.withOpacity(0.8),
                        ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)
              ),
              child: Text(category.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground
                
              ),),
          
          ),
        );

  }


  
}