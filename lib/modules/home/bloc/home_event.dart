part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent({this.todoModel});

  final TodoModel? todoModel;

  @override
  List<Object?> get props => [todoModel];
}
