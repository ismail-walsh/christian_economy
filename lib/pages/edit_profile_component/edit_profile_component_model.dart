import '/flutter_flow/flutter_flow_util.dart';
import 'edit_profile_component_widget.dart' show EditProfileComponentWidget;
import 'package:flutter/material.dart';

class EditProfileComponentModel
    extends FlutterFlowModel<EditProfileComponentWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDataCoverEdit2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataCoverEdit2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataCoverEdit2 = '';

  bool isDataUploading_uploadDataBusinessEdit2 = false;
  FFUploadedFile uploadedLocalFile_uploadDataBusinessEdit2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataBusinessEdit2 = '';

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode;
  TextEditingController? yourNameTextController;
  String? Function(BuildContext, String?)? yourNameTextControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for location widget.
  FocusNode? locationFocusNode;
  TextEditingController? locationTextController;
  String? Function(BuildContext, String?)? locationTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    yourNameFocusNode?.dispose();
    yourNameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    locationFocusNode?.dispose();
    locationTextController?.dispose();
  }
}
