#!/usr/bin/env python3
"""
YouTube-style header redesign:
- Profile image on left
- "Christian Economy" logo text in center
- Search icon button on right
- Remove "Welcome to..." text
- Filter dropdowns moved below as small chips (keep existing implementation)
- Remove search button from current location, replace with icon
"""

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    lines = f.readlines()

# Find the AppBar title section (line 94-97 approximately)
# Replace the Column with welcome text with Row layout

# Find start of AppBar title
for i, line in enumerate(lines):
    if 'title: Column(' in line and i > 90:
        title_start = i
        break

# The structure we want:
# title: Row with:
#   - Profile image (keep existing StreamBuilder)
#   - Expanded with "Christian Economy" text
#   - Search IconButton

# Let's create the new AppBar structure
new_appbar = '''            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              toolbarHeight: 60.0,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile image on left
                  StreamBuilder<List<UsersRow>>(
                    stream: FFAppState().getUserProfile(
                      requestFn: () =>
                          _model.containerSupabaseStream ??= SupaFlow
                              .client
                              .from("users")
                              .stream(primaryKey: ['id'])
                              .eqOrNull(
                                'id',
                                currentUserUid,
                              )
                              .map((list) => list
                                  .map((item) => UsersRow(item))
                                  .toList()),
                    ),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return SizedBox(
                          width: 40.0,
                          height: 40.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        );
                      }
                      List<UsersRow> containerUsersRowList = snapshot.data!;
                      final containerUsersRow = containerUsersRowList.isNotEmpty
                          ? containerUsersRowList.first
                          : null;

                      return InkWell(
                        onTap: () async {
                          context.pushNamed(ProfileWidget.routeName);
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).accent1,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primary,
                              width: 1.0,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 100),
                              fadeOutDuration: Duration(milliseconds: 100),
                              imageUrl: containerUsersRow?.profilePhoto ?? '',
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Icon(
                                Icons.person,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.person,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  // Logo text in center
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: Text(
                        key: ValueKey('Text_zzwp'),
                        'Christian Economy',
                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                          font: GoogleFonts.sourceSans3(),
                          fontSize: 20.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ).addWalkthrough(
                        textR9p2mjp1,
                        _model.welcomeHomeController,
                      ),
                    ),
                  ),
                  // Search icon on right
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 28.0,
                    ),
                    onPressed: () async {
                      context.pushNamed(SearchHomeWidget.routeName);
                    },
                  ),
                ],
              ),
              centerTitle: false,
              elevation: 0.0,
            ),
'''

# Find where to replace - from appBar start to the end of title section
# This is complex, so let's find the closing of the title children and actions

# Write the updated file
with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    # Find and replace appBar through to actions
    content = ''.join(lines)

    # Find the AppBar start
    appbar_start = content.find('            appBar: AppBar(')
    # Find where actions starts (the end of our replacement section)
    actions_start = content.find('              actions: [', appbar_start)

    if appbar_start > 0 and actions_start > 0:
        # Replace everything from appBar to actions
        new_content = content[:appbar_start] + new_appbar + '              actions: [' + content[actions_start + len('              actions: ['):]
        f.write(new_content)
        print("✓ Implemented YouTube-style header")
        print("✓ Profile image (40x40) on left")
        print("✓ 'Christian Economy' logo text in center")
        print("✓ Search icon button on right")
        print("✓ Removed 'Welcome to...' text")
    else:
        f.write(content)
        print("⚠ Could not find AppBar section to replace")
