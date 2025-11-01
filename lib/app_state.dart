import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import 'backend/supabase/supabase.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  final _getBlacklistItemsManager = FutureRequestManager<List<BlacklistRow>>();
  Future<List<BlacklistRow>> getBlacklistItems({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<BlacklistRow>> Function() requestFn,
  }) =>
      _getBlacklistItemsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetBlacklistItemsCache() => _getBlacklistItemsManager.clear();
  void clearGetBlacklistItemsCacheKey(String? uniqueKey) =>
      _getBlacklistItemsManager.clearRequest(uniqueKey);

  final _priorityBusinessManager = StreamRequestManager<List<BusinessRow>>();
  Stream<List<BusinessRow>> priorityBusiness({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BusinessRow>> Function() requestFn,
  }) =>
      _priorityBusinessManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPriorityBusinessCache() => _priorityBusinessManager.clear();
  void clearPriorityBusinessCacheKey(String? uniqueKey) =>
      _priorityBusinessManager.clearRequest(uniqueKey);

  final _businessManager = FutureRequestManager<List<BusinessRow>>();
  Future<List<BusinessRow>> business({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<BusinessRow>> Function() requestFn,
  }) =>
      _businessManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearBusinessCache() => _businessManager.clear();
  void clearBusinessCacheKey(String? uniqueKey) =>
      _businessManager.clearRequest(uniqueKey);

  final _getJobsManager = StreamRequestManager<List<JobsRow>>();
  Stream<List<JobsRow>> getJobs({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<JobsRow>> Function() requestFn,
  }) =>
      _getJobsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetJobsCache() => _getJobsManager.clear();
  void clearGetJobsCacheKey(String? uniqueKey) =>
      _getJobsManager.clearRequest(uniqueKey);

  final _getUserProfileManager = StreamRequestManager<List<UsersRow>>();
  Stream<List<UsersRow>> getUserProfile({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRow>> Function() requestFn,
  }) =>
      _getUserProfileManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetUserProfileCache() => _getUserProfileManager.clear();
  void clearGetUserProfileCacheKey(String? uniqueKey) =>
      _getUserProfileManager.clearRequest(uniqueKey);

  final _getUserProfilePageManager = FutureRequestManager<List<UsersRow>>();
  Future<List<UsersRow>> getUserProfilePage({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRow>> Function() requestFn,
  }) =>
      _getUserProfilePageManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetUserProfilePageCache() => _getUserProfilePageManager.clear();
  void clearGetUserProfilePageCacheKey(String? uniqueKey) =>
      _getUserProfilePageManager.clearRequest(uniqueKey);
}
