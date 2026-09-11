import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';

/// Cubit for home

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitialState());

  Future<void> fetchHome() async {
    emit(const HomeLoadingState());
    try {
      // Add your business logic here
      emit(const HomeSuccessState());
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }
}
