import 'package:alaseel_todos/models/task_model.dart';
import 'package:alaseel_todos/screens/detailed_task_screen.dart';
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
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailedTaskScreen(
                                      taskModel: waitingTasks[index],
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 12),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  waitingTasks[index].name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Checkbox(
                                    value: waitingTasks[index].isDone,
                                    onChanged: (a) {
                                      setState(() {
                                        waitingTasks[index].isDone =
                                            !waitingTasks[index].isDone;

                                        completedTasks.add(waitingTasks[index]);
                                        waitingTasks
                                            .remove(waitingTasks[index]);
                                      });
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(24),
                  itemCount: completedTasks.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailedTaskScreen(
                                      taskModel: completedTasks[index],
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 12),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  completedTasks[index].name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Checkbox(
                                    value: completedTasks[index].isDone,
                                    onChanged: (a) {
                                      setState(() {
                                        completedTasks[index].isDone =
                                            !completedTasks[index].isDone;

                                        waitingTasks.add(completedTasks[index]);
                                        completedTasks
                                            .remove(completedTasks[index]);
                                      });
                                    })
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
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
                                  waitingTasks.add(TaskModel(
                                      name: taskNameController.text,
                                      createdAt: DateTime.now()));
                                  taskNameController.clear();
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
