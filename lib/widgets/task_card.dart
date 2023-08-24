import 'package:alaseel_todos/screens/detailed_task_screen.dart';

import '../models/task_model.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key, required this.taskModel});
  final TaskModel taskModel;
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailedTaskScreen(
                        taskModel: widget.taskModel,
                      )));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            title: Text(
              widget.taskModel.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                "${widget.taskModel.createdAt.toString().substring(0, 10).replaceAll("-", "/")} ${widget.taskModel.createdAt.toString().substring(10, 16).replaceAll("-", "/")}"),
            trailing: Checkbox(
                value: widget.taskModel.isDone,
                onChanged: (a) {
                  setState(() {
                    widget.taskModel.isDone = !widget.taskModel.isDone;
                     // TODO: how i can pass this logic from HomeScreen 
                    // completedTasks.add(widget.taskModel);
                    // waitingTasks.remove(widget.taskModel);
                  });
                }),
          ),
        ));
  }
}
