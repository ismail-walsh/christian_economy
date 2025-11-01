import '../database.dart';

class BusinessTable extends SupabaseTable<BusinessRow> {
  @override
  String get tableName => 'business';

  @override
  BusinessRow createRow(Map<String, dynamic> data) => BusinessRow(data);
}

class BusinessRow extends SupabaseDataRow {
  BusinessRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BusinessTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get user => getField<String>('user');
  set user(String? value) => setField<String>('user', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get industry => getField<String>('industry');
  set industry(String? value) => setField<String>('industry', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get photo => getField<String>('photo');
  set photo(String? value) => setField<String>('photo', value);

  String? get coverPhoto => getField<String>('cover_photo');
  set coverPhoto(String? value) => setField<String>('cover_photo', value);

  String? get contact => getField<String>('contact');
  set contact(String? value) => setField<String>('contact', value);

  bool? get isPromoted => getField<bool>('is_promoted');
  set isPromoted(bool? value) => setField<bool>('is_promoted', value);

  bool? get proChurch => getField<bool>('pro_church');
  set proChurch(bool? value) => setField<bool>('pro_church', value);

  bool? get proLife => getField<bool>('pro_life');
  set proLife(bool? value) => setField<bool>('pro_life', value);

  bool? get proFamily => getField<bool>('pro_family');
  set proFamily(bool? value) => setField<bool>('pro_family', value);

  bool? get proCharity => getField<bool>('pro_charity');
  set proCharity(bool? value) => setField<bool>('pro_charity', value);

  bool? get sundays => getField<bool>('sundays');
  set sundays(bool? value) => setField<bool>('sundays', value);

  String? get website => getField<String>('website');
  set website(String? value) => setField<String>('website', value);

  bool? get vacancies => getField<bool>('vacancies');
  set vacancies(bool? value) => setField<bool>('vacancies', value);

  String? get region => getField<String>('region');
  set region(String? value) => setField<String>('region', value);
}
