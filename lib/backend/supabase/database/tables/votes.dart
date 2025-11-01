import '../database.dart';

class VotesTable extends SupabaseTable<VotesRow> {
  @override
  String get tableName => 'votes';

  @override
  VotesRow createRow(Map<String, dynamic> data) => VotesRow(data);
}

class VotesRow extends SupabaseDataRow {
  VotesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VotesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get blacklistId => getField<int>('blacklist_id');
  set blacklistId(int? value) => setField<int>('blacklist_id', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  bool? get vote => getField<bool>('vote');
  set vote(bool? value) => setField<bool>('vote', value);
}
