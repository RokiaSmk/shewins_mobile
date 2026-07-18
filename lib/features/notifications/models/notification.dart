import 'enums/notification_channel.dart';
import 'enums/notification_status.dart';
import 'enums/notification_type.dart';

class NotificationModel {
  final String id;

  final NotificationType type;

  final NotificationChannel channel;

  final NotificationStatus status;

  final String title;

  final String message;

  final bool read;

  final DateTime? scheduledAt;

  final DateTime? sentAt;

  final DateTime? readAt;

  final DateTime createdAt;

  final DateTime updatedAt;

  const NotificationModel({
    required this.id,
    required this.type,
    required this.channel,
    required this.status,
    required this.title,
    required this.message,
    required this.read,
    this.scheduledAt,
    this.sentAt,
    this.readAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return NotificationModel(
      id: json["id"],

      type: NotificationType.fromJson(
        json["type"],
      ),

      channel: NotificationChannel.fromJson(
        json["channel"],
      ),

      status: NotificationStatus.fromJson(
        json["status"],
      ),

      title: json["title"],

      message: json["message"],

      read: json["read"],

      scheduledAt: json["scheduledAt"] != null
          ? DateTime.parse(
              json["scheduledAt"],
            )
          : null,

      sentAt: json["sentAt"] != null
          ? DateTime.parse(
              json["sentAt"],
            )
          : null,

      readAt: json["readAt"] != null
          ? DateTime.parse(
              json["readAt"],
            )
          : null,

      createdAt: DateTime.parse(
        json["createdAt"],
      ),

      updatedAt: DateTime.parse(
        json["updatedAt"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "type": type.apiValue,
      "channel": channel.apiValue,
      "status": status.apiValue,
      "title": title,
      "message": message,
      "read": read,
      "scheduledAt":
          scheduledAt?.toIso8601String(),
      "sentAt": sentAt?.toIso8601String(),
      "readAt": readAt?.toIso8601String(),
      "createdAt":
          createdAt.toIso8601String(),
      "updatedAt":
          updatedAt.toIso8601String(),
    };
  }
}