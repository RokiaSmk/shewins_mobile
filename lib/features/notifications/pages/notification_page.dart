import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/notification_notifier.dart';
import '../widgets/notification_tile.dart';

class NotificationPage extends ConsumerStatefulWidget {
  const NotificationPage({
    super.key,
  });

  @override
  ConsumerState<NotificationPage>
      createState() =>
          _NotificationPageState();
}

class _NotificationPageState
    extends ConsumerState<NotificationPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(notificationProvider.notifier)
          .loadNotifications();

      ref
          .read(notificationProvider.notifier)
          .loadUnreadNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state =
        ref.watch(notificationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notifications",
        ),

        actions: [
          IconButton(
            onPressed: () async {
              await ref
                  .read(
                    notificationProvider
                        .notifier,
                  )
                  .markAllAsRead();
            },
            icon: const Icon(
              Icons.done_all,
            ),
          ),
        ],
      ),

      body: state.notifications.isEmpty
          ? const Center(
              child: Text(
                "Aucune notification.",
              ),
            )
          : ListView.builder(
              padding:
                  const EdgeInsets.all(16),
              itemCount:
                  state.notifications.length,
              itemBuilder:
                  (_, index) {
                final notification =
                    state.notifications[index];

                return NotificationTile(
                  notification:
                      notification,

                  onTap: () {
                    ref
                        .read(
                          notificationProvider
                              .notifier,
                        )
                        .markAsRead(
                          notification.id,
                        );
                  },

                  onDelete: () {
                    ref
                        .read(
                          notificationProvider
                              .notifier,
                        )
                        .deleteNotification(
                          notification.id,
                        );
                  },
                );
              },
            ),
    );
  }
}