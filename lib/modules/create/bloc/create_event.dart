part of 'create_bloc.dart';

class CreateEvent extends Equatable {
  const CreateEvent({required this.todoModel});

  final TodoModel todoModel;

  @override
  List<Object> get props => [todoModel];
}
