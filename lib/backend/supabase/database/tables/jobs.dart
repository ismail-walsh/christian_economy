import '../database.dart';

class JobsTable extends SupabaseTable<JobsRow> {
  @override
  String get tableName => 'jobs';

  @override
  JobsRow createRow(Map<String, dynamic> data) => JobsRow(data);
}

class JobsRow extends SupabaseDataRow {
  JobsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => JobsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get businessId => getField<int>('business_id');
  set businessId(int? value) => setField<int>('business_id', value);

  String? get jobName => getField<String>('job_name');
  set jobName(String? value) => setField<String>('job_name', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get details => getField<String>('details');
  set details(String? value) => setField<String>('details', value);

  String get industry => getField<String>('industry')!;
  set industry(String value) => setField<String>('industry', value);

  String? get applicationLink => getField<String>('application_link');
  set applicationLink(String? value) =>
      setField<String>('application_link', value);

  String? get userId => getField<String>('userId');
  set userId(String? value) => setField<String>('userId', value);
}
