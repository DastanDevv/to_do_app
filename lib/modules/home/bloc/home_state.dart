part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({this.todoModel});

  final List<TodoModel>? todoModel;

  @override
  List<Object?> get props => [todoModel];

  HomeState copyWith({
    List<TodoModel>? todoModel,
  }) {
    return HomeState(
      todoModel: todoModel ?? this.todoModel,
    );
  }
}
