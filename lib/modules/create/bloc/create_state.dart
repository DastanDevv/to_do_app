part of 'create_bloc.dart';

sealed class CreateState extends Equatable {
  const CreateState();
  
  @override
  List<Object> get props => [];
}

final class CreateInitial extends CreateState {}
