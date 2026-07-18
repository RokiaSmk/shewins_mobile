import 'package:dio/dio.dart';

import '../../../core/network/api_client.dart';
import '../../../core/network/api_constants.dart';

import '../requests/create_notification_request.dart';

import '../responses/notification_response.dart';
import '../responses/notification_list_response.dart';

class NotificationRepository {
  final Dio _dio = ApiClient.dio;

  Future<NotificationResponse> createNotification(
    CreateNotificationRequest request,
  ) async {
    final response = await _dio.post(
      ApiConstants.notifications,
      data: request.toJson(),
    );

    return NotificationResponse.fromJson(
      response.data,
    );
  }

  Future<NotificationListResponse> getNotifications() async {
    final response = await _dio.get(
      ApiConstants.notifications,
    );

    return NotificationListResponse.fromJson(
      response.data,
    );
  }

  Future<NotificationListResponse> getUnreadNotifications() async {
    final response = await _dio.get(
      ApiConstants.unreadNotifications,
    );

    return NotificationListResponse.fromJson(
      response.data,
    );
  }

  Future<NotificationResponse> markAsRead(
    String notificationId,
  ) async {
    final response = await _dio.patch(
      "${ApiConstants.notifications}/$notificationId/read",
    );

    return NotificationResponse.fromJson(
      response.data,
    );
  }

  Future<void> markAllAsRead() async {
    await _dio.patch(
      ApiConstants.markAllNotificationsRead,
    );
  }

  Future<void> deleteNotification(
    String notificationId,
  ) async {
    await _dio.delete(
      "${ApiConstants.notifications}/$notificationId",
    );
  }

  Future<void> deleteAllNotifications() async {
    await _dio.delete(
      ApiConstants.notifications,
    );
  }
}