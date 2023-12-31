import '../model/todo.dart';
import '../model/todos.dart';

abstract class TodosRepository {
  Future<Todos> loadTodos();

  Future<void> saveTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);

  Future<Todo?> getTodoById(String id);

  Future<void> deleteAllTodos();
}
