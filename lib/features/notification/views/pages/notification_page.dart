import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/theme.dart';
import '../../viewmodel/notification_notifier.dart';

class NotificationPage extends ConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsState = ref.watch(notificationNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: notificationsState.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (notifications) {
          if (notifications.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_off,
                    size: 50,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "No new notifications.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              final formattedDate = DateFormat('yyyy-MM-dd').format(notification.createdAt);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.lightThemeMode.colorScheme.surface,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppPalette.greyUnselectedItemColor,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Category with background chip-like design
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppPalette.yellowColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            notification.category,
                            style: AppTheme.labelSmallStyle.copyWith(
                              color: AppPalette.whiteColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Message content
                        Text(
                          notification.message,
                          style: AppTheme.headlineSmallStyle1.copyWith(
                            color: AppTheme.lightThemeMode.colorScheme.onSecondary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Date aligned to the bottom-right
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            formattedDate,
                            style: AppTheme.labelSmallStyle.copyWith(
                              color: Colors.grey.shade500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        error: (error, stackTrace) => Center(
          child: Text('No New Notification'),
        ),
      ),
    );
  }
}
