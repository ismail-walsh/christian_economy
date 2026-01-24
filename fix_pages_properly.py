#!/usr/bin/env python3
"""
Fix pages by:
1. Adding YouTube-style app bar
2. Removing ONLY the search button (not the entire StickyHeader if it contains content)
3. Adding necessary imports and model variables
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

# Process each page
pages = [
    {
        'widget_file': '/Users/Ismail/Downloads/christian_economy/lib/pages/my_businesses/my_businesses_widget.dart',
        'model_file': '/Users/Ismail/Downloads/christian_economy/lib/pages/my_businesses/my_businesses_model.dart',
        'title': 'My Businesses',
        'search_route': 'SearchMyBusinessWidget',
    },
    {
        'widget_file': '/Users/Ismail/Downloads/christian_economy/lib/pages/jobs/jobs_widget.dart',
        'model_file': '/Users/Ismail/Downloads/christian_economy/lib/pages/jobs/jobs_model.dart',
        'title': 'Jobs',
        'search_route': 'SearchJobWidget',
    },
    {
        'widget_file': '/Users/Ismail/Downloads/christian_economy/lib/pages/my_jobs/my_jobs_widget.dart',
        'model_file': '/Users/Ismail/Downloads/christian_economy/lib/pages/my_jobs/my_jobs_model.dart',
        'title': 'My Jobs',
        'search_route': 'SearchMyJobsWidget',
    }
]

for page in pages:
    print(f"\n{'='*60}")
    print(f"Processing {page['title']}...")
    print('='*60)

    # 1. Update widget file - Replace AppBar
    with open(page['widget_file'], 'r') as f:
        content = f.read()

    # Add auth import if not present
    if "import '/auth/supabase_auth/auth_util.dart';" not in content:
        content = content.replace(
            "import '/backend/supabase/supabase.dart';",
            "import '/auth/supabase_auth/auth_util.dart';\nimport '/backend/supabase/supabase.dart';"
        )
        print("  ✓ Added auth import")

    # Replace AppBar
    appbar_start = content.find('          appBar: AppBar(')
    body_start = content.find('          body:', appbar_start)

    if appbar_start > 0 and body_start > 0:
        new_appbar = create_youtube_appbar(page['title'], page['search_route'])
        content = content[:appbar_start] + new_appbar + '\n' + content[body_start:]
        print("  ✓ Replaced AppBar with YouTube-style header")

    # Remove search button/header section if it exists
    # For my_businesses and my_jobs, remove the StickyHeader with search
    if 'my_businesses' in page['widget_file'] or 'my_jobs' in page['widget_file']:
        # Find and remove the StickyHeader containing the search button
        sticky_start = content.find('StickyHeader(')
        if sticky_start > 0:
            # Find the search button within 100 lines
            search_check = content[sticky_start:sticky_start+5000]
            if 'Search...' in search_check or page['search_route'] in search_check:
                # Find the matching closing parenthesis
                paren_count = 0
                start_counting = False
                end_pos = sticky_start
                for i in range(sticky_start, min(sticky_start + 10000, len(content))):
                    if content[i] == '(':
                        paren_count += 1
                        start_counting = True
                    elif content[i] == ')':
                        paren_count -= 1
                        if start_counting and paren_count == 0:
                            end_pos = i + 2  # Include the closing ),
                            break

                if end_pos > sticky_start:
                    content = content[:sticky_start] + content[end_pos:]
                    print("  ✓ Removed redundant search StickyHeader")

    # For jobs page, the search is in a simple Padding/Container structure
    elif 'jobs' in page['widget_file']:
        # Look for the search button pattern
        search_pattern_start = content.find('Padding(\n                    padding: EdgeInsetsDirectional.fromSTEB(\n                        16.0, 6.0, 16.0, 0.0),\n                    child: FFButtonWidget(')
        if search_pattern_start > 0:
            # Find the ending of this widget (the closing ),)
            paren_count = 0
            end_pos = search_pattern_start
            for i in range(search_pattern_start, min(search_pattern_start + 3000, len(content))):
                if content[i] == '(':
                    paren_count += 1
                elif content[i] == ')':
                    paren_count -= 1
                    if paren_count == -2:  # Account for the Padding( and FFButtonWidget(
                        end_pos = i + 2
                        break

            if end_pos > search_pattern_start:
                content = content[:search_pattern_start] + content[end_pos:]
                print("  ✓ Removed redundant search button")

    with open(page['widget_file'], 'w') as f:
        f.write(content)

    # 2. Update model file - Add containerSupabaseStream
    with open(page['model_file'], 'r') as f:
        model_content = f.read()

    if 'containerSupabaseStream' not in model_content:
        # Find the class definition and add the stream variable
        if 'Stream<List' in model_content:
            # Add after existing stream declaration
            model_content = model_content.replace(
                '  Stream<List',
                '  Stream<List<UsersRow>>? containerSupabaseStream;\n  Stream<List',
                1
            )
        else:
            # Add after the comment
            model_content = model_content.replace(
                '  ///  State fields for stateful widgets in this page.\n',
                '  ///  State fields for stateful widgets in this page.\n\n  Stream<List<UsersRow>>? containerSupabaseStream;\n'
            )

        with open(page['model_file'], 'w') as f:
            f.write(model_content)
        print("  ✓ Added containerSupabaseStream to model")

    # 3. Update FAB button color for my_businesses
    if 'my_businesses' in page['widget_file']:
        with open(page['widget_file'], 'r') as f:
            content = f.read()

        # Fix FAB colors
        if 'backgroundColor: FlutterFlowTheme.of(context).tertiary,' in content:
            content = content.replace(
                'backgroundColor: FlutterFlowTheme.of(context).tertiary,',
                'backgroundColor: FlutterFlowTheme.of(context).primaryText,'
            )
            content = content.replace(
                'color: Colors.white,\n              size: 24.0,',
                'color: FlutterFlowTheme.of(context).secondaryBackground,\n              size: 24.0,'
            )
            # For the label text
            lines = content.split('\n')
            for i, line in enumerate(lines):
                if "'Add Business'," in line and i + 2 < len(lines):
                    # Find the color line within next 10 lines
                    for j in range(i, min(i + 10, len(lines))):
                        if 'color: Colors.white,' in lines[j]:
                            lines[j] = lines[j].replace('color: Colors.white,', 'color: FlutterFlowTheme.of(context).secondaryBackground,')
                            break
                    break
            content = '\n'.join(lines)

            with open(page['widget_file'], 'w') as f:
                f.write(content)
            print("  ✓ Fixed FAB button colors")

print("\n" + "="*60)
print("✓ All pages updated successfully!")
print("="*60)
