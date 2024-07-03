import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/api/todo_api.dart';

import '../models/todo.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  final TodoApi todoApi;
  TodosCubit({required this.todoApi}) : super(TodosInitial());

  Future<void> getAllTodos() async {
    try {
      emit(LoadingTodos());
      final todos = await todoApi.getAllTodos();
      emit(TodosLoaded(todos: todos));
    } catch (e) {
      emit(
        ErrorState(
          message: 'Failed to fetch todos.',
          onTryAgain: getAllTodos,
        ),
      );
    }
  }
}
