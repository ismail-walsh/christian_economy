#!/usr/bin/env python3
"""
Final UX improvements:
1. Change FAB button to use accent color instead of primary (to differentiate from navbar)
2. Remove cache limits from profile image for better resolution
3. Add divider lines between sections
4. Keep current header (YouTube style would require major redesign)
"""

# Fix 1: Change FAB to use a different color (tertiary or accent)
with open('/Users/Ismail/Downloads/christian_economy/lib/pages/my_businesses/my_businesses_widget.dart', 'r') as f:
    content = f.read()

# Change FAB to use tertiary color for differentiation
content = content.replace(
    '''            backgroundColor: FlutterFlowTheme.of(context).primary,''',
    '''            backgroundColor: FlutterFlowTheme.of(context).tertiary,'''
)

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/my_businesses/my_businesses_widget.dart', 'w') as f:
    f.write(content)

print("✓ Changed FAB button to tertiary color (different from navbar)")

# Fix 2: Remove cache limits from profile image on home page
with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    content = f.read()

old_profile_img = '''                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 100), // Faster
                                        fadeOutDuration:
                                            Duration(milliseconds: 100),
                                        imageUrl:
                                            containerUsersRow?.profilePhoto ?? '',
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                        maxHeightDiskCache: 100,
                                        maxWidthDiskCache: 100,
                                        memCacheHeight: 50,
                                        memCacheWidth: 50,
                                        placeholder:'''

new_profile_img = '''                                      child: CachedNetworkImage(
                                        fadeInDuration:
                                            Duration(milliseconds: 100), // Faster
                                        fadeOutDuration:
                                            Duration(milliseconds: 100),
                                        imageUrl:
                                            containerUsersRow?.profilePhoto ?? '',
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                        // No cache limits for full resolution
                                        placeholder:'''

content = content.replace(old_profile_img, new_profile_img)

# Fix 3: Add divider after AppBar (before search button)
# Find the search button section and add a divider before it
old_search_section = '''                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: FFButtonWidget('''

new_search_section = '''                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Divider after AppBar
                Divider(
                  thickness: 1.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Align(
                  alignment: AlignmentDirectional(-1.0, 0.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                    child: FFButtonWidget('''

content = content.replace(old_search_section, new_search_section)

# Add divider before filter chips section
old_filters = '''                                  SizedBox(height: 12.0),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowDropDown<String>('''

new_filters = '''                                  SizedBox(height: 12.0),
                                  // Divider before filters
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                    child: Divider(
                                      thickness: 1.0,
                                      color: FlutterFlowTheme.of(context).alternate,
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowDropDown<String>('''

content = content.replace(old_filters, new_filters)

# Add divider before business list
old_business_list = '''                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Christian businesses','''

new_business_list = '''                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Divider before businesses section
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Divider(
                          thickness: 1.0,
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'Christian businesses','''

content = content.replace(old_business_list, new_business_list)

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    f.write(content)

print("✓ Removed cache limits from profile image for full resolution")
print("✓ Added dividers between sections (AppBar → Search → Filters → Businesses)")
print("✓ Keeping current header design (YouTube style would be a major redesign)")
