#!/usr/bin/env python3
"""
Redesign business cards to match blacklist style:
- 70x70 square images (no cover photos)
- Horizontal Row layout
- No rounded corners, shadows, or borders
- Divider separators
- 'Hiring' text vertical under industry
- Remove cache limits for better image quality
"""

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    lines = f.readlines()

# Find the card section (starts at line 1406: return Padding)
# Ends at line 1782: closing of the card widget

# New blacklist-style card design
new_card_section = '''                                        return Align(
                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                borderRadius: BorderRadius.circular(0.0), // No rounded corners
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Align(
                                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                                    child: InkWell(
                                                      splashColor: Colors.transparent,
                                                      focusColor: Colors.transparent,
                                                      hoverColor: Colors.transparent,
                                                      highlightColor: Colors.transparent,
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          BusinessDetailsWidget.routeName,
                                                          queryParameters: {
                                                            'businessId': serializeParam(
                                                              fullBusinessListItem.id,
                                                              ParamType.int,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          // 70x70 square profile image
                                                          Container(
                                                            width: 70.0,
                                                            height: 70.0,
                                                            decoration: BoxDecoration(
                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                            ),
                                                            child: Align(
                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(0.0),
                                                                child: CachedNetworkImage(
                                                                  fadeInDuration: Duration(milliseconds: 100),
                                                                  fadeOutDuration: Duration(milliseconds: 100),
                                                                  imageUrl: fullBusinessListItem.photo ?? '',
                                                                  width: 70.0,
                                                                  height: 70.0,
                                                                  fit: BoxFit.cover,
                                                                  // No cache limits for full quality
                                                                  placeholder: (context, url) => Container(
                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                    child: Icon(
                                                                      Icons.business,
                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                      size: 30.0,
                                                                    ),
                                                                  ),
                                                                  errorWidget: (context, url, error) => Container(
                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                    child: Icon(
                                                                      Icons.business,
                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                      size: 30.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          // Business info
                                                          Flexible(
                                                            child: Align(
                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                              child: Container(
                                                                width: MediaQuery.sizeOf(context).width * 1.0,
                                                                decoration: BoxDecoration(),
                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                  child: Column(
                                                                    mainAxisSize: MainAxisSize.max,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      // Business name
                                                                      Text(
                                                                        valueOrDefault<String>(
                                                                          fullBusinessListItem.name,
                                                                          'Business Name',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars: 38,
                                                                          replacement: '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                          font: GoogleFonts.sourceSans3(
                                                                            fontWeight: FontWeight.w500,
                                                                            fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                          ),
                                                                          fontSize: 18.0,
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.w500,
                                                                          fontStyle: FlutterFlowTheme.of(context).headlineSmall.fontStyle,
                                                                        ),
                                                                      ),
                                                                      // Location
                                                                      Text(
                                                                        valueOrDefault<String>(
                                                                          fullBusinessListItem.location,
                                                                          'No location provided',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars: 30,
                                                                          replacement: '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                          font: GoogleFonts.sourceSans3(
                                                                            fontWeight: FontWeight.normal,
                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize: 12.0,
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                        ),
                                                                      ),
                                                                      // Industry
                                                                      Text(
                                                                        valueOrDefault<String>(
                                                                          fullBusinessListItem.industry,
                                                                          'Industry',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                          font: GoogleFonts.sourceSans3(
                                                                            fontWeight: FontWeight.normal,
                                                                            fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                          ),
                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize: 12.0,
                                                                          letterSpacing: 0.0,
                                                                          fontWeight: FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                        ),
                                                                      ),
                                                                      // Hiring status (with consistent spacing)
                                                                      fullBusinessListItem.vacancies == true
                                                                        ? Text(
                                                                            'Hiring',
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                              font: GoogleFonts.sourceSans3(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                          )
                                                                        : SizedBox(height: 16.0), // Consistent spacing
                                                                    ].divide(SizedBox(height: 4.0)),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  // Divider separator
                                                  Divider(
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(context).alternate,
                                                  ),
                                                ],
                                              ),
                                            ).addWalkthrough(
                                              columnIisrklu0,
                                              _model.welcomeHomeController,
                                            ),
                                          ),
                                        );
'''

# Replace lines 1406-1782 (card section)
start_line = 1406 - 1  # Convert to 0-indexed
end_line = 1783 - 1    # Line after the card ends

new_lines = lines[:start_line] + [new_card_section] + lines[end_line:]

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    f.writelines(new_lines)

print("✓ Redesigned business cards with blacklist style")
print("✓ Removed: cover photos, rounded corners, shadows, borders")
print("✓ Added: 70x70 square images, horizontal Row layout, Divider separators")
print("✓ Changed: 'We're Hiring!' → 'Hiring' vertical under industry")
print("✓ Fixed: consistent spacing for non-hiring businesses")
print("✓ Fixed: removed image cache limits for better quality")
print(f"✓ Replaced {end_line - start_line + 1} lines with {len(new_card_section.splitlines())} lines")
