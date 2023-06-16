import 'package:flutter_todo_app/presentation/view/todos_new.dart';
import 'package:flutter_todo_app/presentation/view/todos_list.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/todos',
  routes: [
    GoRoute(
      path: '/todos',
      builder: (context, state) => const TodosList(),
      routes: [
        GoRoute(
          path: 'new',
          builder: (context, state) => const TodosNew(),
        ),
      ],
    ),
  ],
);
