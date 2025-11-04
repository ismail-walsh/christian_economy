import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'youtube_comment_section_model.dart';
export 'youtube_comment_section_model.dart';

class YoutubeCommentSectionWidget extends StatefulWidget {
  const YoutubeCommentSectionWidget({
    super.key,
    required this.blacklistId,
  });

  final int blacklistId;

  @override
  State<YoutubeCommentSectionWidget> createState() =>
      _YoutubeCommentSectionWidgetState();
}

class _YoutubeCommentSectionWidgetState
    extends State<YoutubeCommentSectionWidget> {
  late YoutubeCommentSectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => YoutubeCommentSectionModel());

    _model.commentInputController ??= TextEditingController();
    _model.commentInputFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userUid = currentUserUid;

    return FutureBuilder<List<BlacklistCommentsRow>>(
      future: _loadComments(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }

        final allComments = snapshot.data!;
        final topLevelComments = allComments
            .where((c) => c.parentCommentId == null || c.parentCommentId!.isEmpty)
            .toList();

        // Sort comments
        _sortComments(topLevelComments);

        final totalCommentsCount = allComments.length;

        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 32.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Comments Header with count and sort
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$totalCommentsCount ${totalCommentsCount == 1 ? 'Comment' : 'Comments'}',
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.sourceSans3(
                            fontWeight:
                                FlutterFlowTheme.of(context).headlineSmall.fontWeight,
                          ),
                          letterSpacing: 0.0,
                        ),
                  ),
                  // Sort dropdown
                  PopupMenuButton<String>(
                    icon: Icon(
                      Icons.sort,
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                    onSelected: (value) {
                      setState(() {
                        _model.sortBy = value;
                      });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'top',
                        child: Row(
                          children: [
                            Icon(Icons.trending_up, size: 20.0),
                            SizedBox(width: 8.0),
                            Text('Top Comments'),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'newest',
                        child: Row(
                          children: [
                            Icon(Icons.access_time, size: 20.0),
                            SizedBox(width: 8.0),
                            Text('Newest First'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24.0),

              // Comment Input Form (at top like YouTube)
              if (userUid != null && userUid.isNotEmpty)
                _buildCommentInput(context, userUid, null),

              SizedBox(height: 24.0),

              // Comments List
              if (topLevelComments.isEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'No comments yet. Be the first to share your thoughts!',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.sourceSans3(),
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                )
              else
                ListView.separated(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: topLevelComments.length,
                  separatorBuilder: (_, __) => SizedBox(height: 24.0),
                  itemBuilder: (context, index) {
                    final comment = topLevelComments[index];
                    final replies = allComments
                        .where((c) => c.parentCommentId == comment.id)
                        .toList();
                    return _buildCommentItem(
                      context,
                      comment,
                      replies,
                      userUid,
                      false,
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCommentInput(
    BuildContext context,
    String currentUserUid,
    String? parentCommentId,
  ) {
    final isReply = parentCommentId != null;

    return Container(
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate,
          width: 1.0,
        ),
      ),
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Avatar
              Container(
                width: 36.0,
                height: 36.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.account_circle,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 36.0,
                ),
              ),
              SizedBox(width: 12.0),
              // Input field
              Expanded(
                child: TextFormField(
                  controller: isReply
                      ? _model.replyInputControllers[parentCommentId]
                      : _model.commentInputController,
                  focusNode: isReply
                      ? _model.replyInputFocusNodes[parentCommentId]
                      : _model.commentInputFocusNode,
                  autofocus: false,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: isReply ? 'Add a reply...' : 'Add a comment...',
                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                          font: GoogleFonts.sourceSans3(),
                          letterSpacing: 0.0,
                        ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.sourceSans3(),
                        letterSpacing: 0.0,
                      ),
                  maxLines: 1,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (isReply)
                TextButton(
                  onPressed: () {
                    setState(() {
                      _model.replyToCommentId = null;
                      _model.replyInputControllers[parentCommentId]?.clear();
                    });
                  },
                  child: Text(
                    'Cancel',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.sourceSans3(),
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              SizedBox(width: 8.0),
              FFButtonWidget(
                onPressed: () => _postComment(context, currentUserUid, parentCommentId),
                text: isReply ? 'Reply' : 'Comment',
                options: FFButtonOptions(
                  height: 36.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).primary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.sourceSans3(),
                        color: Colors.white,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(
    BuildContext context,
    BlacklistCommentsRow comment,
    List<BlacklistCommentsRow> replies,
    String currentUserUid,
    bool isReply,
  ) {
    final netLikes = comment.likesCount - comment.dislikesCount;
    final isReplyingToThis = _model.replyToCommentId == comment.id;
    final userReaction = _model.userReactions[comment.id];
    final isOwnComment = comment.userId == currentUserUid;

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(
        isReply ? 48.0 : 0.0,
        0.0,
        0.0,
        0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Avatar
              Container(
                width: isReply ? 32.0 : 40.0,
                height: isReply ? 32.0 : 40.0,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: CachedNetworkImage(
                  imageUrl: comment.userPhoto ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: FlutterFlowTheme.of(context).accent1,
                    child: Icon(
                      Icons.person,
                      color: FlutterFlowTheme.of(context).primary,
                      size: isReply ? 16.0 : 20.0,
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: FlutterFlowTheme.of(context).accent1,
                    child: Icon(
                      Icons.person,
                      color: FlutterFlowTheme.of(context).primary,
                      size: isReply ? 16.0 : 20.0,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.0),
              // Comment Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User Name and Timestamp
                    Row(
                      children: [
                        Text(
                          comment.userName ?? 'Anonymous',
                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Source Sans Pro',
                                fontWeight: FontWeight.w600,
                                fontSize: isReply ? 14.0 : 15.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          timeago.format(comment.createdAt),
                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                fontFamily: 'Source Sans Pro',
                                color: FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 12.0,
                                letterSpacing: 0.0,
                              ),
                        ),
                        if (comment.isEdited)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                            child: Text(
                              '(edited)',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Source Sans Pro',
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    fontSize: 11.0,
                                    fontStyle: FontStyle.italic,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        if (comment.isPinned)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                            child: Icon(
                              Icons.push_pin,
                              size: 14.0,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    // Comment Text
                    Text(
                      comment.comment,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Source Sans Pro',
                            fontSize: isReply ? 14.0 : 15.0,
                            letterSpacing: 0.0,
                          ),
                    ),
                    SizedBox(height: 8.0),
                    // Action Buttons Row
                    Row(
                      children: [
                        // Like button
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          buttonSize: 36.0,
                          icon: Icon(
                            userReaction == 'like'
                                ? Icons.thumb_up
                                : Icons.thumb_up_outlined,
                            color: userReaction == 'like'
                                ? FlutterFlowTheme.of(context).primary
                                : FlutterFlowTheme.of(context).secondaryText,
                            size: 18.0,
                          ),
                          onPressed: () => _toggleReaction(context, comment.id, 'like'),
                        ),
                        // Like count
                        if (netLikes != 0)
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 8.0, 0.0),
                            child: Text(
                              netLikes > 0 ? '$netLikes' : '${netLikes.abs()}',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Source Sans Pro',
                                    color: FlutterFlowTheme.of(context).secondaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        SizedBox(width: 4.0),
                        // Dislike button
                        FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 20.0,
                          buttonSize: 36.0,
                          icon: Icon(
                            userReaction == 'dislike'
                                ? Icons.thumb_down
                                : Icons.thumb_down_outlined,
                            color: userReaction == 'dislike'
                                ? FlutterFlowTheme.of(context).error
                                : FlutterFlowTheme.of(context).secondaryText,
                            size: 18.0,
                          ),
                          onPressed: () => _toggleReaction(context, comment.id, 'dislike'),
                        ),
                        SizedBox(width: 16.0),
                        // Reply button
                        if (!isReply && currentUserUid.isNotEmpty)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _model.replyToCommentId = comment.id;
                                if (!_model.replyInputControllers.containsKey(comment.id)) {
                                  _model.replyInputControllers[comment.id] =
                                      TextEditingController();
                                  _model.replyInputFocusNodes[comment.id] = FocusNode();
                                }
                              });
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Reply',
                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                    fontFamily: 'Source Sans Pro',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        // Edit/Delete for own comments
                        if (isOwnComment) ...[
                          SizedBox(width: 8.0),
                          PopupMenuButton<String>(
                            icon: Icon(
                              Icons.more_vert,
                              size: 18.0,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            padding: EdgeInsets.zero,
                            onSelected: (value) {
                              if (value == 'edit') {
                                _editComment(context, comment);
                              } else if (value == 'delete') {
                                _deleteComment(context, comment.id);
                              }
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 'edit',
                                child: Row(
                                  children: [
                                    Icon(Icons.edit, size: 18.0),
                                    SizedBox(width: 8.0),
                                    Text('Edit'),
                                  ],
                                ),
                              ),
                              PopupMenuItem(
                                value: 'delete',
                                child: Row(
                                  children: [
                                    Icon(Icons.delete, size: 18.0),
                                    SizedBox(width: 8.0),
                                    Text('Delete'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                    // Reply input (shown when replying to this comment)
                    if (isReplyingToThis && currentUserUid.isNotEmpty)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: _buildCommentInput(context, currentUserUid, comment.id),
                      ),
                    // Show/Hide Replies Button
                    if (!isReply && replies.isNotEmpty)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: TextButton.icon(
                          onPressed: () {
                            setState(() {
                              if (_model.expandedReplies.contains(comment.id)) {
                                _model.expandedReplies.remove(comment.id);
                              } else {
                                _model.expandedReplies.add(comment.id);
                              }
                            });
                          },
                          icon: Icon(
                            _model.expandedReplies.contains(comment.id)
                                ? Icons.expand_less
                                : Icons.expand_more,
                            size: 18.0,
                            color: FlutterFlowTheme.of(context).primary,
                          ),
                          label: Text(
                            _model.expandedReplies.contains(comment.id)
                                ? 'Hide ${replies.length} ${replies.length == 1 ? 'reply' : 'replies'}'
                                : 'View ${replies.length} ${replies.length == 1 ? 'reply' : 'replies'}',
                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                  fontFamily: 'Source Sans Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ),
                    // Replies List
                    if (!isReply && _model.expandedReplies.contains(comment.id))
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: replies.length,
                          separatorBuilder: (_, __) => SizedBox(height: 16.0),
                          itemBuilder: (context, index) {
                            final reply = replies[index];
                            return _buildCommentItem(
                              context,
                              reply,
                              [],
                              currentUserUid,
                              true,
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<List<BlacklistCommentsRow>> _loadComments() async {
    // Query with explicit user data join
    final response = await SupaFlow.client
        .from('blacklist_comments')
        .select('''
          *,
          users!blacklist_comments_user_id_fkey (
            name,
            profile_photo
          )
        ''')
        .eq('blacklist_id', widget.blacklistId);

    // Convert response to BlacklistCommentsRow objects
    final comments = (response as List)
        .map((json) {
          // Flatten the user data into the comment object
          if (json['users'] != null) {
            json['user_name'] = json['users']['name'];
            json['user_photo'] = json['users']['profile_photo'];
          }
          return BlacklistCommentsRow(json);
        })
        .toList();

    // Load user reactions for current user
    if (currentUserUid != null && currentUserUid!.isNotEmpty) {
      final commentIds = comments.map((c) => c.id).toList();
      if (commentIds.isNotEmpty) {
        final reactions = await CommentReactionsTable().queryRows(
          queryFn: (q) => q
              .eq('user_id', currentUserUid!)
              .filter('comment_id', 'in', '(${commentIds.join(',')})'),
        );

        for (var reaction in reactions) {
          _model.userReactions[reaction.commentId] = reaction.reactionType;
        }
      }
    }

    return comments;
  }

  void _sortComments(List<BlacklistCommentsRow> comments) {
    if (_model.sortBy == 'top') {
      comments.sort((a, b) {
        final aScore = (a.likesCount - a.dislikesCount);
        final bScore = (b.likesCount - b.dislikesCount);
        if (bScore != aScore) return bScore.compareTo(aScore);
        // If same score, sort by newest
        return b.createdAt.compareTo(a.createdAt);
      });
    } else {
      // newest first (default)
      comments.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }

    // Pinned comments always at top
    comments.sort((a, b) {
      if (a.isPinned && !b.isPinned) return -1;
      if (!a.isPinned && b.isPinned) return 1;
      return 0;
    });
  }

  Future<void> _postComment(
    BuildContext context,
    String userId,
    String? parentCommentId,
  ) async {
    final controller = parentCommentId != null
        ? _model.replyInputControllers[parentCommentId]
        : _model.commentInputController;

    if (controller?.text.isEmpty ?? true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Please enter a comment',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 3000),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
      return;
    }

    try {
      await BlacklistCommentsTable().insert({
        'blacklist_id': widget.blacklistId,
        'user_id': userId,
        'comment': controller!.text,
        'parent_comment_id': parentCommentId,
        'created_at': DateTime.now().toIso8601String(),
      });

      controller.clear();

      if (parentCommentId != null) {
        setState(() {
          _model.replyToCommentId = null;
        });
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            parentCommentId != null ? 'Reply posted!' : 'Comment posted!',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 2000),
          backgroundColor: FlutterFlowTheme.of(context).secondary,
        ),
      );

      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error posting comment: $e',
            style: TextStyle(
              color: FlutterFlowTheme.of(context).primaryText,
            ),
          ),
          duration: Duration(milliseconds: 3000),
          backgroundColor: FlutterFlowTheme.of(context).error,
        ),
      );
    }
  }

  Future<void> _toggleReaction(
    BuildContext context,
    String commentId,
    String reactionType,
  ) async {
    if (currentUserUid == null || currentUserUid!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please sign in to react to comments'),
          duration: Duration(milliseconds: 2000),
        ),
      );
      return;
    }

    try {
      final currentReaction = _model.userReactions[commentId];

      if (currentReaction == reactionType) {
        // Remove reaction
        await CommentReactionsTable().delete(
          matchingRows: (rows) => rows
              .eq('comment_id', commentId)
              .eq('user_id', currentUserUid!),
        );
        setState(() {
          _model.userReactions.remove(commentId);
        });
      } else {
        // Add or update reaction
        if (currentReaction != null) {
          // Delete old reaction
          await CommentReactionsTable().delete(
            matchingRows: (rows) => rows
                .eq('comment_id', commentId)
                .eq('user_id', currentUserUid!),
          );
        }
        // Insert new reaction
        await CommentReactionsTable().insert({
          'comment_id': commentId,
          'user_id': currentUserUid!,
          'reaction_type': reactionType,
          'created_at': DateTime.now().toIso8601String(),
        });
        setState(() {
          _model.userReactions[commentId] = reactionType;
        });
      }

      setState(() {});
    } catch (e) {
      print('Error toggling reaction: $e');
    }
  }

  Future<void> _editComment(
    BuildContext context,
    BlacklistCommentsRow comment,
  ) async {
    final controller = TextEditingController(text: comment.comment);

    await showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Edit Comment'),
        content: TextField(
          controller: controller,
          maxLines: 4,
          decoration: InputDecoration(
            hintText: 'Edit your comment...',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              if (controller.text.isNotEmpty) {
                await BlacklistCommentsTable().update(
                  data: {
                    'comment': controller.text,
                    'updated_at': DateTime.now().toIso8601String(),
                    'is_edited': true,
                  },
                  matchingRows: (rows) => rows.eq('id', comment.id),
                );
                Navigator.pop(dialogContext);
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Comment updated'),
                    duration: Duration(milliseconds: 2000),
                  ),
                );
              }
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteComment(BuildContext context, String commentId) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text('Delete Comment'),
        content: Text('Are you sure you want to delete this comment?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await BlacklistCommentsTable().delete(
          matchingRows: (rows) => rows.eq('id', commentId),
        );
        setState(() {});
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Comment deleted'),
            duration: Duration(milliseconds: 2000),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error deleting comment'),
            duration: Duration(milliseconds: 2000),
            backgroundColor: FlutterFlowTheme.of(context).error,
          ),
        );
      }
    }
  }
}
