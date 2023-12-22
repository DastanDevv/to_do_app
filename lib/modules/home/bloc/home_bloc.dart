import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/home_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.homeService) : super(const HomeState()) {
    on<HomeEvent>(_getData);
  }

  final HomeService homeService;

  Future<void> _getData(HomeEvent event, Emitter<HomeState> emit) async {
    final todos = await homeService.getData();
    emit(state.copyWith(todoModel: todos));
  }

  Future<void> deleteData(String doc) async {
    await homeService.deleteData(doc);
  }
}
