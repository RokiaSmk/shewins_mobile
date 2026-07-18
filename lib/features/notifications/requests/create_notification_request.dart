import '../models/enums/notification_channel.dart';
import '../models/enums/notification_type.dart';

class CreateNotificationRequest {
  final NotificationType type;

  final NotificationChannel channel;

  final String title;

  final String message;

  final DateTime? scheduledAt;

  const CreateNotificationRequest({
    required this.type,
    required this.channel,
    required this.title,
    required this.message,
    this.scheduledAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "type": type.apiValue,
      "channel": channel.apiValue,
      "title": title,
      "message": message,
      "scheduledAt":
          scheduledAt?.toIso8601String(),
    };
  }
}