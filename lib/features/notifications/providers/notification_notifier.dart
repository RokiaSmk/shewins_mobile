import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../requests/create_notification_request.dart';
import '../repositories/notification_repository.dart';
import 'notification_state.dart';

final notificationProvider =
    NotifierProvider<
      NotificationNotifier,
      NotificationState
    >(
  NotificationNotifier.new,
);

class NotificationNotifier
    extends Notifier<NotificationState> {
  final NotificationRepository _repository =
      NotificationRepository();

  @override
  NotificationState build() {
    return const NotificationState();
  }

  Future<void> loadNotifications() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
    );

    try {
      final response =
          await _repository.getNotifications();

      state = state.copyWith(
        notifications: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );
    } finally {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  Future<void> loadUnreadNotifications() async {
    try {
      final response =
          await _repository.getUnreadNotifications();

      state = state.copyWith(
        unreadNotifications: response.data,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> createNotification(
    CreateNotificationRequest request,
  ) async {
    try {
      await _repository.createNotification(
        request,
      );

      await loadNotifications();
      await loadUnreadNotifications();
    } catch (e) {
      debugPrint(e.toString());

      state = state.copyWith(
        error: e.toString(),
      );
    }
  }

  Future<void> markAsRead(
    String notificationId,
  ) async {
    try {
      await _repository.markAsRead(
        notificationId,
      );

      await loadNotifications();
      await loadUnreadNotifications();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> markAllAsRead() async {
    try {
      await _repository.markAllAsRead();

      await loadNotifications();
      await loadUnreadNotifications();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteNotification(
    String notificationId,
  ) async {
    try {
      await _repository.deleteNotification(
        notificationId,
      );

      await loadNotifications();
      await loadUnreadNotifications();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteAllNotifications() async {
    try {
      await _repository
          .deleteAllNotifications();

      await loadNotifications();
      await loadUnreadNotifications();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}