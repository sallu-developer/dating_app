import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dating_app/domain/usecases/get_users_usecase.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUsersUseCase getUsersUseCase;

  HomeBloc({required this.getUsersUseCase}) : super(HomeInitial()) {
    on<LoadUsersEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final users = await getUsersUseCase();
        emit(HomeLoaded(users));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });

    on<RefreshUsersEvent>((event, emit) async {
      try {
        final users = await getUsersUseCase();
        emit(HomeLoaded(users));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
