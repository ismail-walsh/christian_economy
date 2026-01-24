import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'boycott_details_widget.dart' show BoycottDetailsWidget;
import 'package:flutter/material.dart';

class BoycottDetailsModel extends FlutterFlowModel<BoycottDetailsWidget> {
  ///  State fields for this page.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - Query Rows] action in Button widget.
  List<VotesRow>? doesVoteExist;

  // Track if user has already voted (checked on page load)
  bool hasVoted = false;

  // Vote statistics
  int approveCount = 0;
  int rejectCount = 0;

  // State field(s) for comment input
  FocusNode? commentInputFocusNode;
  TextEditingController? commentInputController;
  String? Function(BuildContext, String?)? commentInputControllerValidator;

  // Stores comments from database
  List<BlacklistCommentsRow>? commentsData;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentInputFocusNode?.dispose();
    commentInputController?.dispose();
  }
}
