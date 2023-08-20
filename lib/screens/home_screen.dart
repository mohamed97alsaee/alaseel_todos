import 'package:alaseel_todos/models/task_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [
    TaskModel(name: "Home Work", createdAt: DateTime.now()),
    TaskModel(name: "Flutter App", createdAt: DateTime.now()),
    TaskModel(name: "Go Home", createdAt: DateTime.now()),
    TaskModel(name: "Go To The Alaseel", createdAt: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tasks[index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Checkbox(
                        value: tasks[index].isDone,
                        onChanged: (a) {
                          setState(() {
                            tasks[index].isDone = !tasks[index].isDone;
                          });
                        })
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          tasks.add(TaskModel(name: "Taks", createdAt: DateTime.now()));
        });
      }),
    );
  }
}
