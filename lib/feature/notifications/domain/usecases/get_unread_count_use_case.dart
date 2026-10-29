import 'package:fynd/feature/notifications/domain/repositories/notifications_repository.dart';

class GetUnreadCountUseCase {
  final NotificationsRepository repository;
  const GetUnreadCountUseCase(this.repository);

  Future<int> call() {
    return repository.getUnreadCount();
  }
}
