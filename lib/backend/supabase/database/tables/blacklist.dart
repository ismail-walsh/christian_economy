import '../database.dart';

class BlacklistTable extends SupabaseTable<BlacklistRow> {
  @override
  String get tableName => 'blacklist';

  @override
  BlacklistRow createRow(Map<String, dynamic> data) => BlacklistRow(data);
}

class BlacklistRow extends SupabaseDataRow {
  BlacklistRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BlacklistTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  String? get justification => getField<String>('justification');
  set justification(String? value) => setField<String>('justification', value);

  DateTime? get expirationDate => getField<DateTime>('expiration_date');
  set expirationDate(DateTime? value) =>
      setField<DateTime>('expiration_date', value);

  int? get yesVotes => getField<int>('yes_votes');
  set yesVotes(int? value) => setField<int>('yes_votes', value);

  int? get noVotes => getField<int>('no_votes');
  set noVotes(int? value) => setField<int>('no_votes', value);

  String? get coverPhoto => getField<String>('cover_photo');
  set coverPhoto(String? value) => setField<String>('cover_photo', value);

  String? get evidence => getField<String>('evidence');
  set evidence(String? value) => setField<String>('evidence', value);
}
