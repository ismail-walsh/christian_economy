import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'guest_home_widget.dart' show GuestHomeWidget;
import 'package:flutter/material.dart';

class GuestHomeModel extends FlutterFlowModel<GuestHomeWidget> {
  ///  State fields for stateful widgets in this page.

  Stream<List<BusinessRow>>? listViewSupabaseStream;
  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
