part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class AddTodo extends TodoEvent {
  final String task;
  const AddTodo({required this.task});

  @override
  List<Object> get props => [task];
}

class DeleteTodo extends TodoEvent {
  final String task;
  const DeleteTodo({required this.task});

  @override
  List<Object> get props => [task];
}
