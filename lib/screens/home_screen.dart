import 'package:alaseel_todos/models/task_model.dart';
import 'package:alaseel_todos/widgets/task_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController taskNameController = TextEditingController();

  List<TaskModel> completedTasks = [];
  List<TaskModel> waitingTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alaseel Todos"),
        backgroundColor: Colors.blue,
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(labelColor: Colors.black, tabs: [
              Tab(
                text: "Waiting",
              ),
              Tab(
                text: "Completed",
              )
            ]),
            Expanded(
                child: TabBarView(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: waitingTasks.length,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      taskModel: waitingTasks[index],
                    );
                  },
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: completedTasks.length,
                  itemBuilder: (context, index) {
                    return TaskCard(taskModel: completedTasks[index]);
                  },
                ),
              ],
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                            hintText: "Enter the task name !"),
                        controller: taskNameController,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancel")),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  if (taskNameController.text.isNotEmpty) {
                                    waitingTasks.add(TaskModel(
                                        name: taskNameController.text,
                                        createdAt: DateTime.now()));
                                    taskNameController.clear();
                                  }
                                });
                                Navigator.pop(context);
                              },
                              child: const Text("Add"))
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
