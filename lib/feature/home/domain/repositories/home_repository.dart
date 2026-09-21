import 'package:fynd/feature/home/domain/entities/home_entity.dart';

abstract class HomeRepository {
  Future<HomeEntity> getHomeInfo();
}
