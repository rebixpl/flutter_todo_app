import 'package:flutter_todo_app/domain/model/todo.dart';

abstract class GetTodoUseCase {
  Future<void> execute(Todo todo);
}
