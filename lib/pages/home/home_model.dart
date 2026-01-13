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

  List<String> availableIndustries = [];
  List<String> availableRegions = [];

  // Pagination state - LinkedIn style
  List<BusinessRow> _allBusinesses = []; // Full list from database
  int _currentPage = 0;
  static const int _batchSize = 12; // Load 12 items at a time (LinkedIn standard)
  bool _isLoadingMore = false;
  bool _hasMoreItems = true;

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

  Future<void> loadBusinesses(BuildContext context) async {
    try {
      // Reset pagination state when reloading
      businessList.clear();
      _currentPage = 0;
      _hasMoreItems = true;
      _isLoadingMore = false;

      // Load ALL businesses but only display first batch (LinkedIn style)
      businessCall = await BusinessTable().queryRows(
        queryFn: (q) => q.order('created_at', ascending: false),
      );

      if (businessCall != null && businessCall!.isNotEmpty) {
        _allBusinesses = businessCall!.toList().cast<BusinessRow>();

        // Load first batch only
        _loadNextBatch();

        // Extract unique industries and regions from ALL businesses
        final industries = _allBusinesses
            .where((b) => b.industry != null && b.industry!.isNotEmpty)
            .map((b) => b.industry!)
            .toSet()
            .toList()
          ..sort();

        final regions = _allBusinesses
            .where((b) => b.region != null && b.region!.isNotEmpty)
            .map((b) => b.region!)
            .toSet()
            .toList()
          ..sort();

        availableIndustries = industries;
        availableRegions = regions;
      }
    } catch (e) {
      // Handle error gracefully - keep empty lists
      print('Error loading businesses: $e');
      businessList = [];
      _allBusinesses = [];
      availableIndustries = [];
      availableRegions = [];
    }
  }

  void _loadNextBatch() {
    final startIndex = _currentPage * _batchSize;
    final endIndex = startIndex + _batchSize;

    if (startIndex >= _allBusinesses.length) {
      _hasMoreItems = false;
      return;
    }

    final batch = _allBusinesses.sublist(
      startIndex,
      endIndex > _allBusinesses.length ? _allBusinesses.length : endIndex,
    );

    businessList.addAll(batch);
    _currentPage++;
    _hasMoreItems = endIndex < _allBusinesses.length;
  }

  Future<void> loadMoreBusinesses() async {
    if (_isLoadingMore || !_hasMoreItems) return;

    _isLoadingMore = true;

    // Simulate slight delay for smooth loading (like LinkedIn)
    await Future.delayed(Duration(milliseconds: 300));

    _loadNextBatch();
    _isLoadingMore = false;
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreItems => _hasMoreItems;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    welcomeHomeController?.finish();
  }
}
