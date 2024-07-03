import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todos_cubit.dart';
import 'package:todo_app/widgets/loading_widget.dart';
import 'package:todo_app/widgets/my_error_widget.dart';
import 'package:todo_app/widgets/todos_widget.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Theme.of(context).canvasColor.withAlpha(200),
        scrolledUnderElevation: 3,
        elevation: 3,
        centerTitle: true,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        title: const Text("Todos"),
      ),
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (BuildContext context, state) {
          if (state is TodosLoaded) {
            return TodosWidget(todos: state.todos);
          } else if (state is LoadingTodos) {
            return const LoadingWidget();
          } else if (state is ErrorState) {
            return MyErrorWidget(
              message: state.message,
              onTryAgain: state.onTryAgain,
            );
          } else {
            return const Center(
              child: Text(
                'Todos App',
                style: TextStyle(fontSize: 20),
              ),
            );
          }
        },
      ),
    );
  }
}
