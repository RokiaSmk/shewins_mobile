import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/notification.dart';
import '../models/enums/notification_type.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;

  final VoidCallback? onTap;

  final VoidCallback? onDelete;

  const NotificationTile({
    super.key,
    required this.notification,
    this.onTap,
    this.onDelete,
  });

  IconData _icon() {
    switch (notification.type) {
      case NotificationType.periodReminder:
        return Icons.water_drop;

      case NotificationType.ovulationReminder:
        return Icons.favorite;

      case NotificationType.fertilityReminder:
        return Icons.spa;

      case NotificationType.healthInsight:
        return Icons.psychology;

      case NotificationType.healthReport:
        return Icons.description;

      case NotificationType.appointmentReminder:
        return Icons.calendar_month;

      case NotificationType.system:
        return Icons.notifications;
    }
  }

  Color _color() {
    switch (notification.type) {
      case NotificationType.periodReminder:
        return Colors.pink;

      case NotificationType.ovulationReminder:
        return Colors.purple;

      case NotificationType.fertilityReminder:
        return Colors.green;

      case NotificationType.healthInsight:
        return Colors.deepPurple;

      case NotificationType.healthReport:
        return Colors.blue;

      case NotificationType.appointmentReminder:
        return Colors.orange;

      case NotificationType.system:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              _color().withOpacity(.15),
          child: Icon(
            _icon(),
            color: _color(),
          ),
        ),

        title: Text(
          notification.title,
          style: TextStyle(
            fontWeight:
                notification.read
                    ? FontWeight.normal
                    : FontWeight.bold,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),

            Text(notification.message),

            const SizedBox(height: 6),

            Text(
              DateFormat(
                "dd/MM/yyyy HH:mm",
              ).format(
                notification.createdAt,
              ),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),

        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "delete") {
              onDelete?.call();
            } else {
              onTap?.call();
            }
          },
          itemBuilder: (_) => const [
            PopupMenuItem(
              value: "read",
              child: Text("Marquer comme lu"),
            ),
            PopupMenuItem(
              value: "delete",
              child: Text("Supprimer"),
            ),
          ],
        ),
      ),
    );
  }
}