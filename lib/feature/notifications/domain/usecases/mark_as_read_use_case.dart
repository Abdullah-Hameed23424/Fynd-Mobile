import 'package:fynd/feature/notifications/domain/repositories/notifications_repository.dart';

class MarkAsReadUseCase {
  final NotificationsRepository repository;
  const MarkAsReadUseCase(this.repository);

  Future<void> call({required int id}) {
    return repository.markAsRead(id: id);
  }
}
