import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'create_business_widget.dart' show CreateBusinessWidget;
import 'package:flutter/material.dart';

class CreateBusinessModel extends FlutterFlowModel<CreateBusinessWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataCover = false;
  FFUploadedFile uploadedLocalFile_uploadDataCover =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataCover = '';

  bool isDataUploading_uploadDataBusiness1 = false;
  FFUploadedFile uploadedLocalFile_uploadDataBusiness1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataBusiness1 = '';

  // State field(s) for businessName widget.
  FocusNode? businessNameFocusNode;
  TextEditingController? businessNameTextController;
  String? Function(BuildContext, String?)? businessNameTextControllerValidator;
  // State field(s) for businessAddress widget.
  FocusNode? businessAddressFocusNode;
  TextEditingController? businessAddressTextController;
  String? Function(BuildContext, String?)?
      businessAddressTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for businessWebsite widget.
  FocusNode? businessWebsiteFocusNode;
  TextEditingController? businessWebsiteTextController;
  String? Function(BuildContext, String?)?
      businessWebsiteTextControllerValidator;
  // State field(s) for businessContact widget.
  FocusNode? businessContactFocusNode;
  TextEditingController? businessContactTextController;
  String? Function(BuildContext, String?)?
      businessContactTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for socialMediaLinks widget.
  FocusNode? socialMediaLinksFocusNode1;
  TextEditingController? socialMediaLinksTextController1;
  String? Function(BuildContext, String?)?
      socialMediaLinksTextController1Validator;
  // State field(s) for socialMediaLinks widget.
  FocusNode? socialMediaLinksFocusNode2;
  TextEditingController? socialMediaLinksTextController2;
  String? Function(BuildContext, String?)?
      socialMediaLinksTextController2Validator;
  // State field(s) for socialMediaLinks widget.
  FocusNode? socialMediaLinksFocusNode3;
  TextEditingController? socialMediaLinksTextController3;
  String? Function(BuildContext, String?)?
      socialMediaLinksTextController3Validator;
  // State field(s) for socialMediaLinks widget.
  FocusNode? socialMediaLinksFocusNode4;
  TextEditingController? socialMediaLinksTextController4;
  String? Function(BuildContext, String?)?
      socialMediaLinksTextController4Validator;
  // State field(s) for socialMediaLinks widget.
  FocusNode? socialMediaLinksFocusNode5;
  TextEditingController? socialMediaLinksTextController5;
  String? Function(BuildContext, String?)?
      socialMediaLinksTextController5Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for vacancies widget.
  bool? vacanciesValue;
  // State field(s) for sundays widget.
  bool? sundaysValue;
  // State field(s) for family widget.
  bool? familyValue;
  // State field(s) for charity widget.
  bool? charityValue;
  // State field(s) for life widget.
  bool? lifeValue;
  // State field(s) for church widget.
  bool? churchValue;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  BusinessRow? createBusiness;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  SocialMediaRow? createYouTube;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  SocialMediaRow? createTwitter;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  SocialMediaRow? createInstagram;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  SocialMediaRow? createTiktok;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  SocialMediaRow? createPatreon;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    businessNameFocusNode?.dispose();
    businessNameTextController?.dispose();

    businessAddressFocusNode?.dispose();
    businessAddressTextController?.dispose();

    businessWebsiteFocusNode?.dispose();
    businessWebsiteTextController?.dispose();

    businessContactFocusNode?.dispose();
    businessContactTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    socialMediaLinksFocusNode1?.dispose();
    socialMediaLinksTextController1?.dispose();

    socialMediaLinksFocusNode2?.dispose();
    socialMediaLinksTextController2?.dispose();

    socialMediaLinksFocusNode3?.dispose();
    socialMediaLinksTextController3?.dispose();

    socialMediaLinksFocusNode4?.dispose();
    socialMediaLinksTextController4?.dispose();

    socialMediaLinksFocusNode5?.dispose();
    socialMediaLinksTextController5?.dispose();
  }
}
