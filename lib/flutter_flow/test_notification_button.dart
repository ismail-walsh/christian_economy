import 'package:flutter/material.dart';
import '/services/push_notification_service.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

/// Debug widget for testing push notifications
/// Add this to any page during development to test notifications
class TestNotificationButton extends StatelessWidget {
  const TestNotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await _testPushNotification();
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Test notification created! Check your notifications.'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      },
      child: const Icon(Icons.notifications_active),
      tooltip: 'Test Push Notification',
    );
  }

  Future<void> _testPushNotification() async {
    // Create a test notification in the database
    await NotificationsTable().insert({
      'user_id': currentUserUid,
      'type': 'test',
      'title': 'Test Notification',
      'message': 'This is a test push notification from Christian Economy app!',
      'is_read': false,
      'created_at': DateTime.now().toIso8601String(),
    });

    // Also trigger a local notification immediately
    await PushNotificationService().sendTestNotification();
  }
}
