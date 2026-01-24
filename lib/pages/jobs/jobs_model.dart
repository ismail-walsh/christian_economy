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

  // Available filter options loaded from businesses
  List<String> availableIndustries = [];
  List<String> availableRegions = [];
  Map<int, BusinessRow> businessesMap = {};

  // State field(s) for industry filter
  String? industryFilter;
  FormFieldController<String>? industryFilterController;

  // State field(s) for region filter
  String? regionFilter;
  FormFieldController<String>? regionFilterController;

  // Filtered jobs list
  List<JobsRow> filteredJobs = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    // Clear cached streams to prevent memory leaks
    listViewSupabaseStream = null;
    containerSupabaseStream = null;
    // Clear cached data
    businessesMap.clear();
    filteredJobs.clear();
  }
}
