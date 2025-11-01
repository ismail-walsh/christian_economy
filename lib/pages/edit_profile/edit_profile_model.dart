import '/flutter_flow/flutter_flow_util.dart';
import '/pages/edit_profile_component/edit_profile_component_widget.dart';
import 'edit_profile_widget.dart' show EditProfileWidget;
import 'package:flutter/material.dart';

class EditProfileModel extends FlutterFlowModel<EditProfileWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for editProfile.
  late EditProfileComponentModel editProfileModel;

  @override
  void initState(BuildContext context) {
    editProfileModel = createModel(context, () => EditProfileComponentModel());
  }

  @override
  void dispose() {
    editProfileModel.dispose();
  }
}
