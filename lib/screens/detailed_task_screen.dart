import '../models/task_model.dart';
import 'package:flutter/material.dart';

class DetailedTaskScreen extends StatefulWidget {
  const DetailedTaskScreen({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;
  @override
  State<DetailedTaskScreen> createState() => _DetailedTaskScreenState();
}

class _DetailedTaskScreenState extends State<DetailedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "This task have been added at the date ${widget.taskModel.createdAt.toString().substring(0, 10).replaceAll("-", "/")} at the time ${widget.taskModel.createdAt.toString().substring(10, 16).replaceAll("-", "/")} ${widget.taskModel.isDone ? "and it's completed" : "and it's waiting"}",
                style: const TextStyle(fontSize: 22),
              ),
              Icon(widget.taskModel.isDone ? Icons.check : Icons.close,
                  color: widget.taskModel.isDone ? Colors.green : Colors.red,
                  size: size.width * 0.5)
            ],
          ),
        ),
      ),
    );
  }
}
