import 'package:fynd/feature/home/data/datasources/home_remote_data_source.dart';
import 'package:fynd/feature/home/data/repositories/home_repository_impl.dart';
import 'package:fynd/feature/home/domain/usecases/get_home_info_use_case.dart';
import 'package:fynd/feature/home/presentation/cubit/home_cubit.dart';

HomeCubit createHomeCubit() {
  final remoteDataSource = HomeRemoteDataSourceImpl();
  final repository = HomeRepositoryImpl(remoteDataSource: remoteDataSource);

  final getHomeInfoUseCase = GetHomeInfoUseCase(repository);

  return HomeCubit(getHomeInfoUseCase: getHomeInfoUseCase);
}
