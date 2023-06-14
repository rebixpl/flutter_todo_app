import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter_todo_app/domain/model/todos.dart';

import '../source/files.dart';
import '../../domain/model/todo.dart';
import '../../domain/repository/todos.dart';

class TodosRepositoryImpl extends TodosRepository {
  TodosRepositoryImpl(this.files);

  final Files files;
  late final String path = 'todos.json';

  @override
  Future<void> deleteAllTodos() async {
    // Delete files by path
    await files.delete(path);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    final todos = await loadTodos();

    // Remove the todo from the list
    final newTodos = todos.values.where((t) => t.id != todo.id).toList();

    // Save the new list
    await files.write(
      path,
      jsonEncode(Todos(values: newTodos).toJson()),
    );
  }

  @override
  Future<Todos> loadTodos() async {
    // Load the todos from path
    final content = await files.read(path);
    if (content == null) return const Todos(values: []);

    // Transform it to json and then the todos list
    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    final todos = await loadTodos();

    // Search the todo by id
    return todos.values.firstWhereOrNull((todo) => todo.id == id);
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    // load the todos
    final todos = await loadTodos();

    // remove the todo from the list if it exists
    final newTodos = todos.values.where((t) => t.id != todo.id).toList();

    // Add the new todo to the list
    newTodos.add(todo);

    // Save the new list
    await files.write(
      path,
      jsonEncode(Todos(values: newTodos).toJson()),
    );
  }
}
