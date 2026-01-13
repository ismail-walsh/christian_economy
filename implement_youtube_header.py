#!/usr/bin/env python3
"""
Implement YouTube-style header redesign for home page
- Profile image (40x40) on left
- "Christian Economy" logo text in center
- Search icon button on right
- Remove "Welcome to..." text
"""

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    content = f.read()

# Find the AppBar section - it starts at "appBar: AppBar(" and ends before "body:"
# We need to replace from "appBar: AppBar(" through the closing of AppBar (before "body:")

appbar_start_marker = "            appBar: AppBar("
body_start_marker = "            body: SafeArea("

appbar_start = content.find(appbar_start_marker)
body_start = content.find(body_start_marker, appbar_start)

if appbar_start == -1 or body_start == -1:
    print("ERROR: Could not find AppBar or body markers")
    exit(1)

# New YouTube-style AppBar
new_appbar = """            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              automaticallyImplyLeading: false,
              toolbarHeight: 60.0,
              title: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Profile image on left (40x40)
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
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
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
                  ).addWalkthrough(
                    textFieldTqhimnvm,
                    _model.welcomeHomeController,
                  ),
                ],
              ),
              actions: [],
              centerTitle: false,
              elevation: 0.0,
            ),
"""

# Build new content
new_content = content[:appbar_start] + new_appbar + content[body_start:]

# Write the updated file
with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    f.write(new_content)

print("✓ Implemented YouTube-style header")
print("✓ Profile image (40x40) on left")
print("✓ 'Christian Economy' logo text in center")
print("✓ Search icon button on right")
print("✓ Removed 'Welcome to...' text")
print("✓ Reduced toolbar height from 140 to 60")
