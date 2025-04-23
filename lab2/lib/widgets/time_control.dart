import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';

class TimeControl extends StatefulWidget {
   const TimeControl({super.key});

   @override
   State<TimeControl> createState() => _TimeControlState();
}

class _TimeControlState extends State<TimeControl> {
  double _Time = 60;

  @override
Widget build(BuildContext context) {
  var recipe_handler = Provider.of<RecipeHandler>(context, listen: false);
  return Column(
    children: [
      Slider(
        value: _Time,
        divisions: 40,
        max: 200,
        onChanged: (double value) {
          setState(() {
            _Time = value;
            recipe_handler.setMaxTime(value.toInt());
          });
        },
      ),
      Text('${_Time.round()} minuter'),
     ],
 );
}
}