import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo_app/presentation/viewmodel/module.dart';

import '../../data/repository/module.dart';

class TodosList extends ConsumerWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ref.watch(getTodosProvider).map(
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error) => Center(
              child: Text(
                error.stackTrace.toString(),
              ),
            ),
            data: (todos) => ListView.builder(
              itemCount: todos.value.values.length,
              itemBuilder: (context, index) {
                final todo = todos.value.values[index];
                return ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description ?? ''),
                );
              },
            ),
          ),
    );
  }
}
