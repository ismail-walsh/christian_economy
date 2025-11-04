import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'notification_settings_widget.dart' show NotificationSettingsWidget;
import 'package:flutter/material.dart';

class NotificationSettingsModel
    extends FlutterFlowModel<NotificationSettingsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores the user's notification preferences from database
  NotificationPreferencesRow? notificationPreferences;

  // State field(s) for SwitchListTile widget.
  bool? pushNotifications;
  bool? emailNotifications;
  bool? newBusinesses;
  bool? blacklistUpdates;
  bool? jobPostings;
  bool? promotedBusinesses;
  bool? businessUpdates;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
