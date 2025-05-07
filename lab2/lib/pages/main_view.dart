import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/ingredient.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/recipe_area.dart';
import 'package:lab2/widgets/recipe_detail.dart';
import 'package:lab2/widgets/recipe_list.dart';
import 'package:lab2/widgets/time_control.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

@override
Widget build(BuildContext context) {
   return Scaffold(
     body: Row(children: [
      _controlPanel(context),
     SizedBox(width: AppTheme.paddingSmall,),
     RecipeArea()]),
   );
}

Widget _controlPanel(context, {double width = 320}) {
   return Container(
    width: width,
    color: const Color.fromARGB(255, 193, 210, 218),
    child: Column(
      children: [

        Logo(),
        Text("\n"),

        Text('Receptsök'),
        Text('Sök efter recept'),
       
        IngredientControl(),
        KitchenControl(),
        Text("Svårighet"),
        DifficulyControl(),
        Text("Pris"),
        PriceControl(),
        Text("Tid"),
        TimeControl()
        ],)
    );
}




}
