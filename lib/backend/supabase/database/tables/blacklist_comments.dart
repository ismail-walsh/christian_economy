import '../database.dart';

class BlacklistCommentsTable extends SupabaseTable<BlacklistCommentsRow> {
  @override
  String get tableName => 'blacklist_comments';

  @override
  BlacklistCommentsRow createRow(Map<String, dynamic> data) =>
      BlacklistCommentsRow(data);
}

class BlacklistCommentsRow extends SupabaseDataRow {
  BlacklistCommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BlacklistCommentsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get blacklistId => getField<int>('blacklist_id')!;
  set blacklistId(int value) => setField<int>('blacklist_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get comment => getField<String>('comment')!;
  set comment(String value) => setField<String>('comment', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  // YouTube-style features
  String? get parentCommentId => getField<String>('parent_comment_id');
  set parentCommentId(String? value) => setField<String>('parent_comment_id', value);

  int get likesCount => getField<int>('likes_count') ?? 0;
  set likesCount(int value) => setField<int>('likes_count', value);

  int get dislikesCount => getField<int>('dislikes_count') ?? 0;
  set dislikesCount(int value) => setField<int>('dislikes_count', value);

  int get repliesCount => getField<int>('replies_count') ?? 0;
  set repliesCount(int value) => setField<int>('replies_count', value);

  bool get isEdited => getField<bool>('is_edited') ?? false;
  set isEdited(bool value) => setField<bool>('is_edited', value);

  bool get isPinned => getField<bool>('is_pinned') ?? false;
  set isPinned(bool value) => setField<bool>('is_pinned', value);

  // Joined fields from users table
  String? get userName => getField<String>('user_name');
  String? get userPhoto => getField<String>('user_photo');
}
