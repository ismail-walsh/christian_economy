import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_blacklist_widget.dart' show CreateBlacklistWidget;
import 'package:flutter/material.dart';

class CreateBlacklistModel extends FlutterFlowModel<CreateBlacklistWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_boycottCover = false;
  FFUploadedFile uploadedLocalFile_boycottCover =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_boycottCover = '';

  bool isDataUploading_boycottProfile = false;
  FFUploadedFile uploadedLocalFile_boycottProfile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_boycottProfile = '';

  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;
  // State field(s) for evidence widget.
  FocusNode? evidenceFocusNode;
  TextEditingController? evidenceTextController;
  String? Function(BuildContext, String?)? evidenceTextControllerValidator;
  // State field(s) for justification widget.
  FocusNode? justificationFocusNode;
  TextEditingController? justificationTextController;
  String? Function(BuildContext, String?)? justificationTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  BlacklistRow? createBusiness;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();

    evidenceFocusNode?.dispose();
    evidenceTextController?.dispose();

    justificationFocusNode?.dispose();
    justificationTextController?.dispose();
  }
}
