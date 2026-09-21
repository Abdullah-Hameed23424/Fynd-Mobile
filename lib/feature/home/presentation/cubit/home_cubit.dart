import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fynd/core/errors/error_handler/exception_handler.dart';
import 'package:fynd/feature/home/domain/entities/home_entity.dart';
import 'package:fynd/feature/home/domain/usecases/get_home_info_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeInfoUseCase getHomeInfoUseCase;
  HomeCubit({required this.getHomeInfoUseCase}) : super(HomeInitial());

  Future<void> getHomeInfo() async {
    emit(HomeLoading());

    try {
      final HomeEntity homeEntity = await getHomeInfoUseCase();

      emit(HomeLoaded(homeEntity: homeEntity));
    } catch (e, s) {
      logApiName('getHomeInfo');
      emit(HomeError(msg: handleError(e, stackTrace: s)));
    }
  }
}
