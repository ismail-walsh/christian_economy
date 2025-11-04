import '../database.dart';

class CommentReactionsTable extends SupabaseTable<CommentReactionsRow> {
  @override
  String get tableName => 'comment_reactions';

  @override
  CommentReactionsRow createRow(Map<String, dynamic> data) =>
      CommentReactionsRow(data);
}

class CommentReactionsRow extends SupabaseDataRow {
  CommentReactionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CommentReactionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get commentId => getField<String>('comment_id')!;
  set commentId(String value) => setField<String>('comment_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get reactionType => getField<String>('reaction_type')!; // 'like' or 'dislike'
  set reactionType(String value) => setField<String>('reaction_type', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
