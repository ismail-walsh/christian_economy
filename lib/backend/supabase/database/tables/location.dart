import '../database.dart';

class LocationTable extends SupabaseTable<LocationRow> {
  @override
  String get tableName => 'location';

  @override
  LocationRow createRow(Map<String, dynamic> data) => LocationRow(data);
}

class LocationRow extends SupabaseDataRow {
  LocationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationTable();

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);
}
