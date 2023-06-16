import '../model/todos.dart';

import '../model/todo.dart';

abstract class TodosRepository {
  Future<Todos> loadTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);

  Future<Todo?> getTodoById(String id);

  Future<void> deleteAllTodos();
}
