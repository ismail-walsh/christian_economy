import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'jobs_widget.dart' show JobsWidget;
import 'package:flutter/material.dart';

class JobsModel extends FlutterFlowModel<JobsWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<JobsRow>>? listViewSupabaseStream;
  Stream<List<UsersRow>>? containerSupabaseStream;

  // State field(s) for job type filter
  String? jobTypeFilter;
  FormFieldController<List<String>>? jobTypeFilterController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
