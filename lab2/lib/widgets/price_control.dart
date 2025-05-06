import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';
import 'package:lab2/app_theme.dart';

class PriceControl extends StatefulWidget {
   const PriceControl({super.key});

   @override
   State<PriceControl> createState() => _PriceControlState();
}

class _PriceControlState extends State<PriceControl> {
  double _price = 60;

  @override
Widget build(BuildContext context) {
  var recipe_handler = Provider.of<RecipeHandler>(context, listen: false);
  return Column(
    children: [
      Slider(
        value: _price,
        divisions: 40,
        max: 200,
        onChanged: (double value) {
          setState(() {
            _price = value;
            recipe_handler.setMaxPrice(value.toInt());
          });
        },
      ),
      Row(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    Padding(
      padding: const EdgeInsets.only(right: AppTheme.paddingLarge),
      child: Text('${_price.round()} kr'),
    ),
  ],
),
     ],
 );
}
}