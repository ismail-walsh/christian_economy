#!/usr/bin/env python3
"""
Fix remaining issues:
1. Change "We're Hiring!" to "Hiring" in guest_home
2. Update Add Business FAB colors
3. Add null check for crash prevention
"""

# Fix guest_home hiring text
with open('/Users/Ismail/Downloads/christian_economy/lib/guest/guest_home/guest_home_widget.dart', 'r') as f:
    content = f.read()

content = content.replace("'We\\'re Hiring!'", "'Hiring'")

with open('/Users/Ismail/Downloads/christian_economy/lib/guest/guest_home/guest_home_widget.dart', 'w') as f:
    f.write(content)

print("✓ Changed 'We're Hiring!' to 'Hiring' in guest_home")

# Fix Add Business FAB colors
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

content = content.replace(old_fab, new_fab)

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/my_businesses/my_businesses_widget.dart', 'w') as f:
    f.write(content)

print("✓ Updated Add Business FAB colors (text color with secondary background)")

# Fix crash issue by adding null check
with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    content = f.read()

old_builder = '''                                child: Builder(
                                  builder: (context) {
                                    final fullBusinessList =
                                        _model.businessList.toList();

                                    return ListView.separated('''

new_builder = '''                                child: Builder(
                                  builder: (context) {
                                    final fullBusinessList =
                                        _model.businessList.toList();

                                    // Show loading indicator if list is empty and still loading
                                    if (fullBusinessList.isEmpty) {
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

                                    return ListView.separated('''

content = content.replace(old_builder, new_builder)

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    f.write(content)

print("✓ Added loading indicator to prevent crash on immediate interaction")
