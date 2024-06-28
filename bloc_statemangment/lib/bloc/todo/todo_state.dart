part of 'todo_bloc.dart';

class TodoState extends Equatable {
  final List<String> todoslist;
  const TodoState({this.todoslist = const <String>[]});

  TodoState copyWith({List<String>? todoslist}) {
    return TodoState(todoslist: todoslist ?? this.todoslist);
  }

  @override
  List<Object> get props => [todoslist];
}
