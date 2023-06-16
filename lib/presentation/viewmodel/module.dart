import 'package:flutter_todo_app/domain/usecases/module.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/model/todos.dart';

part 'module.g.dart';

@riverpod
Future<Todos> todosList(TodosListRef ref) async {
  final usecase = ref.watch(getTodosProvider);
  final items = await usecase.execute();
  return items;
}
