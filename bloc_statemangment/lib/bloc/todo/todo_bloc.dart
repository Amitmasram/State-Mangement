import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<String> todos = [];
  TodoBloc() : super(const TodoState()) {
    on<AddTodo>(_addTodo);
    on<DeleteTodo>(_deleteTodo);
  }

  void _addTodo(AddTodo event, Emitter<TodoState> emit) {
    todos.add(event.task);
    emit(state.copyWith(todoslist: List.from(todos)));
  }

  void _deleteTodo(DeleteTodo event, Emitter<TodoState> emit) {
    todos.remove(event.task);
    emit(state.copyWith(todoslist: List.from(todos)));
  }
}
