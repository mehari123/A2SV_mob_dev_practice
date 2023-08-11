import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app/features/domain/entities/todo_task.dart';
import 'package:todo_app/features/domain/repositories/taskInterface.dart';


class MockTaskInterface extends Mock implements TaskInterface {}


void main() {
  late MockTaskInterface mockTaskInterface;


  setUp(() {
    mockTaskInterface = MockTaskInterface();
  });

  test('should add a task and return a success result', () async {
    // Arrange
    final task = ToDoTask("New Task", "Description", DateTime.now(), false);
    final updatedTaskList = [task]; // Updated task list after adding the new task
    when(mockTaskInterface.addTask(any))
        .thenAnswer((_) async => Right(updatedTaskList));

    var mockAddTaskUsecase;
    when(mockAddTaskUsecase.execute(any))
        .thenAnswer((_) async => Right(updatedTaskList));

    // Act
    final result = await mockAddTaskUsecase.execute(task);

    // Assert
    expect(result, Right(updatedTaskList));
    verify(mockTaskInterface.addTask(task)).called(1); // Verify if addTask was called with the correct task
    verifyNoMoreInteractions(mockTaskInterface);
  });

  // Add more tests for different scenarios, like error cases, etc.
}
