import '../models/notification.dart';

class NotificationListResponse {
  final bool success;
  final String message;
  final List<NotificationModel> data;

  const NotificationListResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory NotificationListResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return NotificationListResponse(
      success: json["success"],
      message: json["message"],
      data: (json["data"] as List)
          .map(
            (e) => NotificationModel.fromJson(e),
          )
          .toList(),
    );
  }
}