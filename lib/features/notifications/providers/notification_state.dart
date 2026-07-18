import '../models/notification.dart';

class NotificationState {
  final bool isLoading;

  final List<NotificationModel> notifications;

  final List<NotificationModel> unreadNotifications;

  final String? error;

  const NotificationState({
    this.isLoading = false,
    this.notifications = const [],
    this.unreadNotifications = const [],
    this.error,
  });

  NotificationState copyWith({
    bool? isLoading,
    List<NotificationModel>? notifications,
    List<NotificationModel>? unreadNotifications,
    String? error,
  }) {
    return NotificationState(
      isLoading: isLoading ?? this.isLoading,
      notifications:
          notifications ?? this.notifications,
      unreadNotifications:
          unreadNotifications ??
          this.unreadNotifications,
      error: error,
    );
  }
}