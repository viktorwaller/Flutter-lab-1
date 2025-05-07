import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;

  @override
Widget build(BuildContext context) {
  return Card(
  elevation: 4,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: InkWell( // Nytt
    borderRadius: BorderRadius.circular(12),
    splashColor: Colors.blue.withAlpha(30),
    onTap: onTap,
    child: Container( // Som förut
      
      height: 128,
      child: Row(
        
        children: [
        _image(recipe),
        const SizedBox(width: AppTheme.paddingMedium,),
        Expanded(
          
          child: Align(
            alignment: Alignment.centerLeft,
            
            child: Column(
              
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              
              Text(recipe.name,style: AppTheme.mediumHeading),
              Text(
                recipe.description,
                overflow: TextOverflow.ellipsis, 
                maxLines: 2,
              ),
              Row(children: [

                SizedBox(child: MainIngredient.icon(recipe.mainIngredient, width: 40),),
                SizedBox(width: AppTheme.paddingSmall,),
                SizedBox(child: Difficulty.icon(recipe.difficulty, width: 50),),
                SizedBox(width: AppTheme.paddingSmall,),
                Text('${recipe.time.round()} min'),
                SizedBox(width: AppTheme.paddingSmall,),
                Text('${recipe.price.round()} kr'),

              ]),
            ],
          ),
          )
         ),
       ],
     ),
    ),)
  );
}
}
Widget _image(recipe) {
  var square = ClipRect(
    child: Container(
      width: 104, // Square width
      height: 104, // Square height
      child: FittedBox(fit: BoxFit.cover, child: recipe.image),
    ),
  );
  var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0);

  return Stack(
    children: [square, Positioned(bottom: 8, right: 8, child: flagImage!)],
  );
 }
