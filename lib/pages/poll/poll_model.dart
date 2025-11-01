import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/request_manager.dart';

import 'poll_widget.dart' show PollWidget;
import 'package:flutter/material.dart';

class PollModel extends FlutterFlowModel<PollWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;

  /// Query cache managers for this widget.

  final _votesManager = FutureRequestManager<List<VotesRow>>();
  Future<List<VotesRow>> votes({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VotesRow>> Function() requestFn,
  }) =>
      _votesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearVotesCache() => _votesManager.clear();
  void clearVotesCacheKey(String? uniqueKey) =>
      _votesManager.clearRequest(uniqueKey);

  final _againstVotesManager = FutureRequestManager<List<VotesRow>>();
  Future<List<VotesRow>> againstVotes({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<VotesRow>> Function() requestFn,
  }) =>
      _againstVotesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAgainstVotesCache() => _againstVotesManager.clear();
  void clearAgainstVotesCacheKey(String? uniqueKey) =>
      _againstVotesManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    /// Dispose query cache managers for this widget.

    clearVotesCache();

    clearAgainstVotesCache();
  }
}
