import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_job_widget.dart' show CreateJobWidget;
import 'package:flutter/material.dart';

class CreateJobModel extends FlutterFlowModel<CreateJobWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for positionName widget.
  FocusNode? positionNameFocusNode;
  TextEditingController? positionNameTextController;
  String? Function(BuildContext, String?)? positionNameTextControllerValidator;
  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;
  // State field(s) for applicationLink widget.
  FocusNode? applicationLinkFocusNode;
  TextEditingController? applicationLinkTextController;
  String? Function(BuildContext, String?)?
      applicationLinkTextControllerValidator;
  // State field(s) for justification widget.
  FocusNode? justificationFocusNode;
  TextEditingController? justificationTextController;
  String? Function(BuildContext, String?)? justificationTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  JobsRow? createBusiness;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    positionNameFocusNode?.dispose();
    positionNameTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();

    applicationLinkFocusNode?.dispose();
    applicationLinkTextController?.dispose();

    justificationFocusNode?.dispose();
    justificationTextController?.dispose();
  }
}
