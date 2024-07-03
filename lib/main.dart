import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todos_cubit.dart';
import 'package:todo_app/pages/todos_page.dart';

import 'api/todo_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodosCubit>(
      create: (ctx) => TodosCubit(todoApi: TodoApi())..getAllTodos(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: BlocProvider<TodosCubit>(
          create: (ctx) => TodosCubit(todoApi: TodoApi())..getAllTodos(),
          child: const TodosPage(),
        ),
      ),
    );
  }
}
