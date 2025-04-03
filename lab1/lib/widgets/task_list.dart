import 'package:flutter/material.dart';
import 'package:lab1/model/task_handler.dart';
import 'package:lab1/widgets/delete_button.dart';
import 'package:lab1/widgets/status_icon.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
   const TaskList({super.key});

  @override
  Widget build(BuildContext context) {

    var taskHandler = context.watch<TaskHandler>();
    var tasks = taskHandler.activeTasks;

    return ListView(children: [
      for (final task in tasks) 
      Card(
          elevation: 10,
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            leading: StatusIcon(task),
            title: Text(task.title),
            onTap: (){taskHandler.toggleTask(task);},
            trailing: DeleteButton(
              onPressed: () {taskHandler.deleteTask(task);},
              ),
              ),
        ),
    ]);
  }
}