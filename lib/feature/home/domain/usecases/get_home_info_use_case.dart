import 'package:fynd/feature/home/domain/entities/home_entity.dart';
import 'package:fynd/feature/home/domain/repositories/home_repository.dart';

class GetHomeInfoUseCase {
  final HomeRepository homeRepository;
  GetHomeInfoUseCase(this.homeRepository);

  Future<HomeEntity> call() async {
    return await homeRepository.getHomeInfo();
  }
}
