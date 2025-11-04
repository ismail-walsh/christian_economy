import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'boycott_details_widget.dart' show BoycottDetailsWidget;
import 'package:flutter/material.dart';

class BoycottDetailsModel extends FlutterFlowModel<BoycottDetailsWidget> {
  ///  State fields for this page.

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
