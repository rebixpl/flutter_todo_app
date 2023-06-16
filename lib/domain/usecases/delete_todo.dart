import 'package:flutter_todo_app/domain/model/todo.dart';

abstract class DeleteTodoUseCase {
  Future<void> execute(Todo todo);
}
