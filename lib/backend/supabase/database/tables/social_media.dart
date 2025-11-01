import '../database.dart';

class SocialMediaTable extends SupabaseTable<SocialMediaRow> {
  @override
  String get tableName => 'socialMedia';

  @override
  SocialMediaRow createRow(Map<String, dynamic> data) => SocialMediaRow(data);
}

class SocialMediaRow extends SupabaseDataRow {
  SocialMediaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SocialMediaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get socialName => getField<String>('socialName');
  set socialName(String? value) => setField<String>('socialName', value);

  String? get link => getField<String>('link');
  set link(String? value) => setField<String>('link', value);

  String get description => getField<String>('description')!;
  set description(String value) => setField<String>('description', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  String? get businessName => getField<String>('businessName');
  set businessName(String? value) => setField<String>('businessName', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);
}
