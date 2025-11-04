import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class YoutubeCommentSectionModel extends FlutterFlowModel {
  // Comment input for top-level comments
  FocusNode? commentInputFocusNode;
  TextEditingController? commentInputController;

  // Reply inputs (one per comment being replied to)
  Map<String, TextEditingController> replyInputControllers = {};
  Map<String, FocusNode> replyInputFocusNodes = {};

  // State
  String? replyToCommentId;
  Set<String> expandedReplies = {};
  Map<String, String> userReactions = {}; // commentId -> 'like' or 'dislike'
  String sortBy = 'newest'; // 'newest' or 'top'

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    commentInputFocusNode?.dispose();
    commentInputController?.dispose();

    replyInputFocusNodes.values.forEach((node) => node.dispose());
    replyInputControllers.values.forEach((controller) => controller.dispose());
  }

  void onUpdate() {
    // Called when setState is triggered
  }
}
