import 'package:fynd/feature/notifications/domain/repositories/notifications_repository.dart';

class MarkAllAsReadUseCase {
  final NotificationsRepository repository;
  const MarkAllAsReadUseCase(this.repository);

  Future<void> call() {
    return repository.markAllAsRead();
  }
}
