import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/data/repository/todos_impl.dart';
import 'package:flutter_todo_app/domain/repository/todos.dart';

final todosProvider = Provider<TodosRepository>((ref) {
  return TodosRepositoryImpl();
});
