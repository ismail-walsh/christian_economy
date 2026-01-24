#!/usr/bin/env python3
"""
Redesign theme toggle with three clear buttons: Light, Dark, Auto
Replace the two confusing switches with segmented-style buttons
"""

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/profile/profile_widget.dart', 'r') as f:
    content = f.read()

# Find and replace the theme toggle section (lines 844-1012)
old_theme_section = '''                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.sunny_snowing,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Use Device Settings',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  font: GoogleFonts.openSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Switch.adaptive(
                                              value: _model.systemModeValue!,
                                              onChanged: (newValue) async {
                                                safeSetState(() =>
                                                    _model.systemModeValue =
                                                        newValue);
                                                if (newValue) {
                                                  setDarkModeSetting(context,
                                                      ThemeMode.system);
                                                  safeSetState(() {
                                                    _model.darkModeValue =
                                                        false;
                                                  });
                                                }
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(
                                          Icons.dark_mode,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            'Dark Mode',
                                            style: FlutterFlowTheme.of(context)
                                                .labelLarge
                                                .override(
                                                  font: GoogleFonts.openSans(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLarge
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelLarge
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: Switch.adaptive(
                                              value: _model.darkModeValue!,
                                              onChanged: (newValue) async {
                                                safeSetState(() => _model
                                                    .darkModeValue = newValue);
                                                if (newValue) {
                                                  setDarkModeSetting(
                                                      context, ThemeMode.dark);
                                                  safeSetState(() {
                                                    _model.systemModeValue =
                                                        false;
                                                  });
                                                }
                                              },
                                              activeColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              activeTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              inactiveTrackColor:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              inactiveThumbColor:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),'''

new_theme_section = '''                              // Theme toggle - Three clear options
                              Padding(
                                padding: EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                      child: Text(
                                        'Appearance',
                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                          font: GoogleFonts.openSans(),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        // Light Mode Button
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              setDarkModeSetting(context, ThemeMode.light);
                                              safeSetState(() {
                                                _model.systemModeValue = false;
                                                _model.darkModeValue = false;
                                              });
                                            },
                                            child: Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: !_model.systemModeValue! && !_model.darkModeValue!
                                                    ? FlutterFlowTheme.of(context).primary
                                                    : FlutterFlowTheme.of(context).secondaryBackground,
                                                borderRadius: BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(context).alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.light_mode,
                                                    color: !_model.systemModeValue! && !_model.darkModeValue!
                                                        ? Colors.white
                                                        : FlutterFlowTheme.of(context).secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  SizedBox(width: 8.0),
                                                  Text(
                                                    'Light',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.openSans(),
                                                      color: !_model.systemModeValue! && !_model.darkModeValue!
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(context).primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.0),
                                        // Dark Mode Button
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              setDarkModeSetting(context, ThemeMode.dark);
                                              safeSetState(() {
                                                _model.systemModeValue = false;
                                                _model.darkModeValue = true;
                                              });
                                            },
                                            child: Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: !_model.systemModeValue! && _model.darkModeValue!
                                                    ? FlutterFlowTheme.of(context).primary
                                                    : FlutterFlowTheme.of(context).secondaryBackground,
                                                borderRadius: BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(context).alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.dark_mode,
                                                    color: !_model.systemModeValue! && _model.darkModeValue!
                                                        ? Colors.white
                                                        : FlutterFlowTheme.of(context).secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  SizedBox(width: 8.0),
                                                  Text(
                                                    'Dark',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.openSans(),
                                                      color: !_model.systemModeValue! && _model.darkModeValue!
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(context).primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.0),
                                        // Auto Mode Button
                                        Expanded(
                                          child: InkWell(
                                            onTap: () async {
                                              setDarkModeSetting(context, ThemeMode.system);
                                              safeSetState(() {
                                                _model.systemModeValue = true;
                                                _model.darkModeValue = false;
                                              });
                                            },
                                            child: Container(
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color: _model.systemModeValue!
                                                    ? FlutterFlowTheme.of(context).primary
                                                    : FlutterFlowTheme.of(context).secondaryBackground,
                                                borderRadius: BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(context).alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.brightness_auto,
                                                    color: _model.systemModeValue!
                                                        ? Colors.white
                                                        : FlutterFlowTheme.of(context).secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  SizedBox(width: 8.0),
                                                  Text(
                                                    'Auto',
                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                      font: GoogleFonts.openSans(),
                                                      color: _model.systemModeValue!
                                                          ? Colors.white
                                                          : FlutterFlowTheme.of(context).primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),'''

content = content.replace(old_theme_section, new_theme_section)

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/profile/profile_widget.dart', 'w') as f:
    f.write(content)

print("✓ Redesigned theme toggle with three clear buttons: Light, Dark, Auto")
print("✓ Removed confusing switches, added visual segmented control")
