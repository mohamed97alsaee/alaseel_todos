import '../models/task_model.dart';


import 'package:flutter/material.dart';

class TasksProvider with  ChangeNotifier {

  List<TaskModel> completedTasks = [];
  List<TaskModel> waitingTasks = [];

  addNewTask(TaskModel taskModel){
  waitingTasks.add(taskModel);
  notifyListeners();
  }





  switchTask(TaskModel taskModel){
       // Check the isDone
   if(taskModel.isDone){
       // Switch isDone
       taskModel.isDone = !taskModel.isDone  ;
       // add to waiting
       waitingTasks.add(taskModel);
       // remove from completed
       completedTasks.remove(taskModel);
    }else{
       // Switch isDone
       taskModel.isDone = ! taskModel.isDone  ;
       // add to completed
       completedTasks.add(taskModel);
       // remove from waiting
       waitingTasks.remove(taskModel);
    }
      notifyListeners();
  }




}