import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

/// Push Notification Service for Supabase
/// Handles local notifications for database-driven notifications
/// Supports both foreground and background notification delivery
class PushNotificationService {
  static final PushNotificationService _instance = PushNotificationService._internal();
  factory PushNotificationService() => _instance;
  PushNotificationService._internal();

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  StreamSubscription<List<Map<String, dynamic>>>? _notificationSubscription;
  Set<String> _shownNotificationIds = {};
  bool _isInitialized = false;

  /// Initialize the push notification service
  Future<void> initialize() async {
    if (_isInitialized) return;

    // Initialize local notifications
    const androidSettings = AndroidInitializationSettings('@mipmap/launcher_icon');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Request permissions
    await _requestPermissions();

    _isInitialized = true;
  }

  /// Request notification permissions
  Future<bool> _requestPermissions() async {
    if (Platform.isAndroid) {
      if (await Permission.notification.isDenied) {
        final status = await Permission.notification.request();
        return status.isGranted;
      }
      return true;
    } else if (Platform.isIOS) {
      final status = await Permission.notification.request();
      return status.isGranted;
    }
    return true;
  }

  /// Start listening for new notifications from Supabase
  Future<void> startListening() async {
    if (!_isInitialized) {
      await initialize();
    }

    // Don't start if user is not logged in
    if (currentUserUid.isEmpty) return;

    // Cancel existing subscription if any
    await _notificationSubscription?.cancel();

    try {
      // Listen to real-time changes in the notifications table
      final stream = SupaFlow.client
          .from('notifications')
          .stream(primaryKey: ['id']).listen((List<Map<String, dynamic>> data) {
            // Filter for current user and unread notifications
            final userNotifications = data.where((n) =>
                n['user_id'] == currentUserUid &&
                (n['is_read'] == false || n['is_read'] == null));
            _handleNewNotifications(userNotifications.toList());
          });

      _notificationSubscription = stream;
    } catch (e) {
      if (kDebugMode) {
        print('Error starting notification listener: $e');
      }
    }
  }

  /// Handle incoming notifications
  void _handleNewNotifications(List<Map<String, dynamic>> notifications) {
    for (var notificationData in notifications) {
      final id = notificationData['id'] as String?;
      if (id == null || _shownNotificationIds.contains(id)) continue;

      // Mark as shown
      _shownNotificationIds.add(id);

      // Show the notification
      _showNotification(
        id: id.hashCode,
        title: notificationData['title'] as String? ?? 'New Notification',
        body: notificationData['message'] as String? ?? '',
        payload: id,
      );
    }
  }

  /// Show a local notification
  Future<void> _showNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'christian_economy_channel',
      'Christian Economy Notifications',
      channelDescription: 'Notifications for Christian Economy app',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }

  /// Handle notification tap
  void _onNotificationTapped(NotificationResponse response) async {
    final payload = response.payload;
    if (payload == null) return;

    try {
      // Mark notification as read in database
      await NotificationsTable().update(
        data: {'is_read': true},
        matchingRows: (rows) => rows.eq('id', payload),
      );

      // You can add navigation logic here based on notification type
      // For example: navigate to business details, job details, etc.
    } catch (e) {
      if (kDebugMode) {
        print('Error marking notification as read: $e');
      }
    }
  }

  /// Stop listening for notifications
  Future<void> stopListening() async {
    await _notificationSubscription?.cancel();
    _notificationSubscription = null;
    _shownNotificationIds.clear();
  }

  /// Check if notifications are enabled for this user
  Future<bool> areNotificationsEnabled() async {
    try {
      final prefs = await NotificationPreferencesTable().queryRows(
        queryFn: (q) => q.eq('user_id', currentUserUid),
      );

      if (prefs.isEmpty) return true; // Default to enabled
      return prefs.first.pushNotifications == true;
    } catch (e) {
      if (kDebugMode) {
        print('Error checking notification preferences: $e');
      }
      return true;
    }
  }

  /// Manually send a test notification (for testing purposes)
  Future<void> sendTestNotification() async {
    await _showNotification(
      id: DateTime.now().millisecondsSinceEpoch,
      title: 'Test Notification',
      body: 'Push notifications are working!',
    );
  }

  /// Get notification permission status
  Future<PermissionStatus> getPermissionStatus() async {
    return await Permission.notification.status;
  }

  /// Clean up resources
  void dispose() {
    _notificationSubscription?.cancel();
    _shownNotificationIds.clear();
  }
}
