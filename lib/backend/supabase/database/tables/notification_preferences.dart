import '../database.dart';

class NotificationPreferencesTable
    extends SupabaseTable<NotificationPreferencesRow> {
  @override
  String get tableName => 'notification_preferences';

  @override
  NotificationPreferencesRow createRow(Map<String, dynamic> data) =>
      NotificationPreferencesRow(data);
}

class NotificationPreferencesRow extends SupabaseDataRow {
  NotificationPreferencesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => NotificationPreferencesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  // Notification preferences
  bool get newBusinesses => getField<bool>('new_businesses') ?? true;
  set newBusinesses(bool value) => setField<bool>('new_businesses', value);

  bool get blacklistUpdates => getField<bool>('blacklist_updates') ?? true;
  set blacklistUpdates(bool value) =>
      setField<bool>('blacklist_updates', value);

  bool get jobPostings => getField<bool>('job_postings') ?? true;
  set jobPostings(bool value) => setField<bool>('job_postings', value);

  bool get promotedBusinesses => getField<bool>('promoted_businesses') ?? true;
  set promotedBusinesses(bool value) =>
      setField<bool>('promoted_businesses', value);

  bool get businessUpdates => getField<bool>('business_updates') ?? true;
  set businessUpdates(bool value) =>
      setField<bool>('business_updates', value);

  bool get emailNotifications => getField<bool>('email_notifications') ?? true;
  set emailNotifications(bool value) =>
      setField<bool>('email_notifications', value);

  bool get pushNotifications => getField<bool>('push_notifications') ?? true;
  set pushNotifications(bool value) =>
      setField<bool>('push_notifications', value);
}
