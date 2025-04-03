import 'package:flutter/material.dart';
import 'package:lab1/widgets/task_list.dart';



class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Things Todo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
      body: TaskList()
      );

  }
}



