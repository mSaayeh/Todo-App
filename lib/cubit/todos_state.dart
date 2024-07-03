part of 'todos_cubit.dart';

@immutable
sealed class TodosState {}

final class TodosInitial extends TodosState {}

final class TodosLoaded extends TodosState {
  final List<Todo> todos;

  TodosLoaded({required this.todos});
}

final class LoadingTodos extends TodosState {}

final class ErrorState extends TodosState {
  final String message;
  final void Function() onTryAgain;

  ErrorState({required this.message, required this.onTryAgain});
}
