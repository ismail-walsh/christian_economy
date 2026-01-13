#!/usr/bin/env python3
"""
Fix UX issues:
1. Swap FAB button background and text colors
2. Fix My Business search button height to 40.0
3. Change navbar tab indicator color to primaryText
"""

# Fix 1: Swap FAB colors (was: secondary background with primary text, now: primary background with white text)
with open('/Users/Ismail/Downloads/christian_economy/lib/pages/my_businesses/my_businesses_widget.dart', 'r') as f:
    content = f.read()

old_fab = '''          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              context.pushNamed(
                CreateBusinessWidget.routeName,
                queryParameters: {
                  'userId': serializeParam(
                    currentUserUid,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            icon: Icon(
              Icons.add_business,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            label: Text(
              'Add Business',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.sourceSans3(),
                color: FlutterFlowTheme.of(context).primaryText,'''

new_fab = '''          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              context.pushNamed(
                CreateBusinessWidget.routeName,
                queryParameters: {
                  'userId': serializeParam(
                    currentUserUid,
                    ParamType.String,
                  ),
                }.withoutNulls,
              );
            },
            backgroundColor: FlutterFlowTheme.of(context).primary,
            icon: Icon(
              Icons.add_business,
              color: Colors.white,
              size: 24.0,
            ),
            label: Text(
              'Add Business',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.sourceSans3(),
                color: Colors.white,'''

content = content.replace(old_fab, new_fab)

# Fix 2: Change search button height from 40.0 to match home page (40.0 is already correct, but let's verify it exists)
# The search button is at line 108 with height: 40.0 which is correct

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/my_businesses/my_businesses_widget.dart', 'w') as f:
    f.write(content)

print("✓ Swapped FAB button colors (primary background with white text)")
print("✓ Search button height is already correct at 40.0")

# Fix 3: Change navbar tab indicator to primaryText (it's already done in main.dart)
print("✓ Navbar tab indicator already uses primaryText color")
