class TaskModel {
  String name;
  bool isDone;
  DateTime createdAt;

  TaskModel({
    required this.name,
     this.isDone = false,
    required this.createdAt
  });
}
