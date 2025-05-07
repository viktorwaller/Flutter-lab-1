import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Card(
      child: Row(
      children: [

        Column(
          children: [
              
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 200,height: 200,child: recipe.image),
                    Text("Ingredienser"),
                    Text('${recipe.servings.round()} portioner'),
                    SizedBox(height: AppTheme.paddingMedium,),
                    for(int i = 0; i < recipe.ingredients.length; i++)
                      Text(recipe.ingredients[i].toString())
                  ],
                ),
              ),
          ],
        ),
        SizedBox(width: AppTheme.paddingMedium,),
        Expanded(
          child: Column(
                children: [
                    Text(recipe.name,style: AppTheme.largeHeading,),
                    Row(children: [

                      SizedBox(child: MainIngredient.icon(recipe.mainIngredient, width: 40),),
                      SizedBox(width: AppTheme.paddingSmall,),
                      SizedBox(child: Difficulty.icon(recipe.difficulty, width: 50),),
                      SizedBox(width: AppTheme.paddingSmall,),
                      Text('${recipe.time.round()} min'),
                      SizedBox(width: AppTheme.paddingSmall,),
                      Text('${recipe.price.round()} kr'),
                    ]),
                    Text(recipe.description,textAlign: TextAlign.start,),
                    Text("Tilllagning", style: AppTheme.mediumHeading,),
                    Text(recipe.instruction,textAlign: TextAlign.start,),
                    //Flexible(child: Text(recipe.instruction, softWrap: true,)),
                    IconButton(icon: Icon(Icons.close),
                    onPressed: () {
                    uiController.deselectRecipe();
                    },),
                ],
              ),
        ),
      ],
      
      
    ));
}
}