import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_businesses_widget.dart' show MyBusinessesWidget;
import 'package:flutter/material.dart';

class MyBusinessesModel extends FlutterFlowModel<MyBusinessesWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<BusinessRow>>? listViewSupabaseStream;
  // Stores action output result for [Backend Call - Query Rows] action in ListView widget.
  List<BusinessRow>? pullToRefreshData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
