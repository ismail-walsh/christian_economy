import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'blacklist_widget.dart' show BlacklistWidget;
import 'package:flutter/material.dart';

class BlacklistModel extends FlutterFlowModel<BlacklistWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<VotesRow>? doesVoteExist;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
