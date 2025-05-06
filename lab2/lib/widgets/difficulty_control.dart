import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:provider/provider.dart';

class DifficulyControl extends StatefulWidget {
   const DifficulyControl({super.key});

   @override
   State<DifficulyControl> createState() => _DifficulyControlState();
}

class _DifficulyControlState extends State<DifficulyControl> {
  String _difficulty = Difficulty.labels[0];


  @override

  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    return Column(
  children: [
    for (int i = 0; i < Difficulty.labels.length; i++)
      RadioListTile<String>(
        dense: true,
        title: Row(
          children: [
            if (i > 0) ...[ // Visa ikon och text för alla rader utom den första
              // Här behöver du komma åt din ikon.
              // Antag att du har en lista med ikoner i Difficulty.icons
              // och att den första platsen är null eller motsvarande.
              if (Difficulty.icons != null && i < Difficulty.icons.length && Difficulty.icons[i] != null)
                Padding(
                  padding: EdgeInsets.only(right: AppTheme.paddingMedium),
                  child: Difficulty.icons[i], // Visa din ikon-widget här (t.ex. Image eller Icon)
                ),
              Text(Difficulty.labels[i]),
            ] else // Visa bara texten för den första raden
              Text(Difficulty.labels[i]),
          ],
        ),
        value: Difficulty.labels[i],
        groupValue: _difficulty,
        onChanged: (value) {
          setState(() {
            _difficulty = value!;
            recipeHandler.setDifficulty(value);
          });
        },
      ),
  ],
);

}
}