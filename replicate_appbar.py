#!/usr/bin/env python3
"""
Replicate the YouTube-style app bar from home page to all main pages:
- My Businesses, Blacklist, Jobs, My Jobs
- Profile image on left, page title in center, search icon on right
"""

def create_youtube_appbar(page_title, search_route):
    """Create the YouTube-style AppBar code"""
    return f'''          appBar: AppBar(
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
                  builder: (context, snapshot) {{
                    if (!snapshot.hasData) {{
                      return SizedBox(
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      );
                    }}
                    List<UsersRow> containerUsersRowList = snapshot.data!;
                    final containerUsersRow = containerUsersRowList.isNotEmpty
                        ? containerUsersRowList.first
                        : null;

                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {{
                        context.pushNamed(ProfileWidget.routeName);
                      }},
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
                  }},
                ),
                // Page title in center
                Expanded(
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    child: Text(
                      '{page_title}',
                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.sourceSans3(),
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                      ),
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
                  onPressed: () async {{
                    context.pushNamed({search_route}.routeName);
                  }},
                ),
              ],
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),'''

# Pages to update
pages = [
    {
        'file': '/Users/Ismail/Downloads/christian_economy/lib/pages/my_businesses/my_businesses_widget.dart',
        'title': 'My Businesses',
        'search_route': 'SearchMyBusinessWidget',
        'appbar_marker': '          appBar: AppBar(',
        'body_marker': '          body: SingleChildScrollView('
    },
    {
        'file': '/Users/Ismail/Downloads/christian_economy/lib/pages/blacklist/blacklist_widget.dart',
        'title': 'Boycott',
        'search_route': 'SearchBlacklistWidget',
        'appbar_marker': '          appBar: AppBar(',
        'body_marker': '          body: SingleChildScrollView('
    },
    {
        'file': '/Users/Ismail/Downloads/christian_economy/lib/pages/jobs/jobs_widget.dart',
        'title': 'Jobs',
        'search_route': 'SearchJobWidget',
        'appbar_marker': '          appBar: AppBar(',
        'body_marker': '          body: SingleChildScrollView('
    },
    {
        'file': '/Users/Ismail/Downloads/christian_economy/lib/pages/my_jobs/my_jobs_widget.dart',
        'title': 'My Jobs',
        'search_route': 'SearchMyJobsWidget',
        'appbar_marker': '          appBar: AppBar(',
        'body_marker': '          body: SingleChildScrollView('
    }
]

for page in pages:
    print(f"\nProcessing {page['title']}...")

    with open(page['file'], 'r') as f:
        content = f.read()

    # Find AppBar start and body start
    appbar_start = content.find(page['appbar_marker'])
    body_start = content.find(page['body_marker'], appbar_start)

    if appbar_start == -1 or body_start == -1:
        print(f"  ⚠ Could not find markers in {page['title']}")
        continue

    # Create new AppBar
    new_appbar = create_youtube_appbar(page['title'], page['search_route'])

    # Build new content
    new_content = content[:appbar_start] + new_appbar + '\n' + content[body_start:]

    # Write back
    with open(page['file'], 'w') as f:
        f.write(new_content)

    print(f"  ✓ Updated {page['title']} with YouTube-style header")

print("\n✓ All main pages updated with YouTube-style app bar!")
