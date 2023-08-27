import 'package:alaseel_todos/models/task_model.dart';
import 'package:alaseel_todos/providers/tasks_provider.dart';
import 'package:alaseel_todos/widgets/task_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController taskNameController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context , tasksConsumer , child) {
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
                      itemCount:tasksConsumer . waitingTasks.length,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          onTaskSwitch:  (){

Provider.of<TasksProvider>(context,listen:false)
.switchTask(tasksConsumer .waitingTasks[index]);


                          },
                          taskModel: tasksConsumer .waitingTasks[index],
                        );
                      },
                    ),
                     ListView.builder(
                         padding: const EdgeInsets.all(24),
                      itemCount: tasksConsumer .completedTasks.length,
                         itemBuilder: (context, index) {
                        return TaskCard(taskModel: tasksConsumer .completedTasks[index], onTaskSwitch: (){
                          Provider.of<TasksProvider>(context,listen:false).switchTask(tasksConsumer .completedTasks[index]);
 
                        },);

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

                                      if (taskNameController.text.isNotEmpty) {
                                     Provider.of<TasksProvider>(context,listen:false).addNewTask(TaskModel(
                                            name: taskNameController.text,
                                            createdAt: DateTime.now()));


                                        setState(() {
                                          taskNameController.clear();
                                        });
                                      }
                               
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
    );
  }
}
