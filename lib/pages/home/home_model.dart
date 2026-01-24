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
      // Reset state when reloading
      businessList.clear();
      _allBusinesses.clear();
      _currentPage = 1; // Start at 1 since initial load is page 0
      _hasMoreItems = false; // Will be set based on results
      _isLoadingMore = false;

      // Load all businesses on initial load (no limit)
      businessCall = await BusinessTable().queryRows(
        queryFn: (q) => q.order('created_at', ascending: false),
      );

      if (businessCall != null && businessCall!.isNotEmpty) {
        businessList = businessCall!.toList().cast<BusinessRow>();
        _allBusinesses = businessCall!.toList().cast<BusinessRow>();
        _hasMoreItems = false; // All loaded, no more to fetch

        // Extract filter options from the loaded data
        _extractFilterOptions(businessList);
      }

      // Clear the temporary reference to free memory
      businessCall = null;
    } catch (e) {
      // Handle error gracefully - keep empty lists
      print('Error loading businesses: $e');
      businessList = [];
      _allBusinesses = [];
      availableIndustries = [];
      availableRegions = [];
    }
  }

  // Extract filter options from existing data - no extra database query
  void _extractFilterOptions(List<BusinessRow> businesses) {
    final industries = businesses
        .where((b) => b.industry != null && b.industry!.isNotEmpty)
        .map((b) => b.industry!)
        .toSet()
        .toList()
      ..sort();

    final regions = businesses
        .where((b) => b.region != null && b.region!.isNotEmpty)
        .map((b) => b.region!)
        .toSet()
        .toList()
      ..sort();

    availableIndustries = industries;
    availableRegions = regions;
  }

  Future<void> loadMoreBusinesses() async {
    if (_isLoadingMore || !_hasMoreItems) return;

    _isLoadingMore = true;

    try {
      // Fetch next batch from database with offset
      final offset = _currentPage * _batchSize;
      final moreBusiness = await BusinessTable().queryRows(
        queryFn: (q) => q
            .order('created_at', ascending: false)
            .range(offset, offset + _batchSize - 1),
      );

      if (moreBusiness != null && moreBusiness.isNotEmpty) {
        businessList.addAll(moreBusiness.cast<BusinessRow>());
        _currentPage++;
        _hasMoreItems = moreBusiness.length >= _batchSize;
      } else {
        _hasMoreItems = false;
      }
    } catch (e) {
      print('Error loading more businesses: $e');
    } finally {
      _isLoadingMore = false;
    }
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreItems => _hasMoreItems;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    welcomeHomeController?.finish();
    // Clear cached streams to prevent memory leaks
    listViewSupabaseStream = null;
    containerSupabaseStream = null;
    // Clear business lists
    businessList.clear();
    _allBusinesses.clear();
    // Clear all temporary query results to free memory
    businessCall = null;
    unfilteredCallWoRegion = null;
    unfilteredCallWRegion = null;
    apiResultWoRegion = null;
    unfilteredBackupCall1 = null;
    apiResultWRegion = null;
    unfilteredBackupCall2 = null;
    allAllCall = null;
    unfilteredRegionCall = null;
    apiResultRegionAll = null;
    unfilteredBackupAllRegionCall = null;
    apiResultRegionInd = null;
    unfilteredBackupRegionCall = null;
  }
}
