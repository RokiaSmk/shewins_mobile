import '../models/notification.dart';

class NotificationResponse {
  final bool success;
  final String message;
  final NotificationModel data;

  const NotificationResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory NotificationResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return NotificationResponse(
      success: json["success"],
      message: json["message"],
      data: NotificationModel.fromJson(
        json["data"],
      ),
    );
  }
}