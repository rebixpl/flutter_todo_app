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
  Future<void> deleteTodo(Todo todo) async {
    // Delete files by path
    await files.delete(path);
  }

  @override
  Future<void> deleteAllTodos() {
    // TODO: implement deleteAllTodos
    throw UnimplementedError();
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
  Future<void> saveTodo(Todo todo) {
    // TODO: implement saveTodo
    throw UnimplementedError();
  }
}
