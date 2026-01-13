import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_jobs_widget.dart' show MyJobsWidget;
import 'package:flutter/material.dart';

class MyJobsModel extends FlutterFlowModel<MyJobsWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<JobsRow>>? listViewSupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in ListView widget.
  List<BusinessRow>? pullToRefreshData;
  Stream<List<UsersRow>>? containerSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
