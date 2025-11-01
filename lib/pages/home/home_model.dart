import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<BusinessRow> businessList = [];
  void addToBusinessList(BusinessRow item) => businessList.add(item);
  void removeFromBusinessList(BusinessRow item) => businessList.remove(item);
  void removeAtIndexFromBusinessList(int index) => businessList.removeAt(index);
  void insertAtIndexInBusinessList(int index, BusinessRow item) =>
      businessList.insert(index, item);
  void updateBusinessListAtIndex(int index, Function(BusinessRow) updateFn) =>
      businessList[index] = updateFn(businessList[index]);

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? welcomeHomeController;
  // Stores action output result for [Backend Call - Query Rows] action in Home widget.
  List<BusinessRow>? businessCall;
  Stream<List<BusinessRow>>? listViewSupabaseStream;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? unfilteredCallWoRegion;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? unfilteredCallWRegion;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? apiResultWoRegion;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? unfilteredBackupCall1;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? apiResultWRegion;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? unfilteredBackupCall2;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? allAllCall;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? unfilteredRegionCall;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? apiResultRegionAll;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? unfilteredBackupAllRegionCall;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? apiResultRegionInd;
  // Stores action output result for [Backend Call - Query Rows] action in DropDown widget.
  List<BusinessRow>? unfilteredBackupRegionCall;
  Stream<List<UsersRow>>? containerSupabaseStream;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    welcomeHomeController?.finish();
  }
}
