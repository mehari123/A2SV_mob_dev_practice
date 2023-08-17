import '../models/todo_model.dart';
import 'package:equatable/equatable.dart';

abstract class TodoLocalDataSource extends Equatable {
  Future<todoModel> viewTask(String id);

  Future<List<todoModel>> viewAllTask();

  Future<List<todoModel>> addTask(todoModel task);
  Future<void> cachTasks(List<todoModel> task);
}
