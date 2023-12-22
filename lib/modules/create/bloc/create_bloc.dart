import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/home_service.dart';

part 'create_event.dart';
part 'create_state.dart';

class CreateBloc extends Bloc<CreateEvent, CreateState> {
  CreateBloc(this.homeService) : super(CreateInitial()) {
    on<CreateEvent>(_setData);
  }
  final HomeService homeService;

  Future<void> _setData(CreateEvent event, Emitter<CreateState> emit) async {
    await homeService.setData(event.todoModel);
  }
}
