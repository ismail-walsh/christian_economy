#!/usr/bin/env python3
"""
Replace dropdown filters with LinkedIn-style horizontal scrollable filter chips
"""

# Read the file
with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    lines = f.readlines()

# New filter chip implementation (LinkedIn style)
new_filter_section = '''                                  // LinkedIn-style horizontal scrollable filter chips
                                  Container(
                                    width: double.infinity,
                                    height: 50.0,
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        // All filter chip
                                        Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
                                          child: FilterChip(
                                            label: Text('All'),
                                            selected: (_model.dropDownValue1 == null || _model.dropDownValue1 == 'All') &&
                                                     (_model.dropDownValue2 == null || _model.dropDownValue2 == 'All'),
                                            onSelected: (selected) async {
                                              if (selected) {
                                                _model.dropDownValueController1?.reset();
                                                _model.dropDownValueController2?.reset();
                                                safeSetState(() {
                                                  _model.dropDownValue1 = null;
                                                  _model.dropDownValue2 = null;
                                                });

                                                _model.allAllCall = await BusinessTable().queryRows(
                                                  queryFn: (q) => q.order('created_at', ascending: false),
                                                );

                                                if (_model.allAllCall != null && _model.allAllCall!.isNotEmpty) {
                                                  _model.businessList.clear();
                                                  _model.businessList = _model.allAllCall!.toList().cast<BusinessRow>();
                                                  safeSetState(() {});
                                                }
                                              }
                                            },
                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                              font: GoogleFonts.sourceSans3(),
                                              fontSize: 14.0,
                                              letterSpacing: 0.0,
                                            ),
                                            selectedColor: FlutterFlowTheme.of(context).primary,
                                            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                            elevation: 2.0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                              side: BorderSide(
                                                color: FlutterFlowTheme.of(context).alternate,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        // Industry filter chips
                                        ...(_model.availableIndustries.map((industry) {
                                          return Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                            child: FilterChip(
                                              label: Text(industry),
                                              selected: _model.dropDownValue1 == industry,
                                              onSelected: (selected) async {
                                                if (selected) {
                                                  safeSetState(() => _model.dropDownValue1 = industry);

                                                  // Filter by industry (and region if selected)
                                                  if (_model.dropDownValue2 == null || _model.dropDownValue2 == 'All' || _model.dropDownValue2 == '') {
                                                    _model.unfilteredRegionCall = await BusinessTable().queryRows(
                                                      queryFn: (q) => q.eqOrNull('industry', industry).order('created_at', ascending: false),
                                                    );
                                                    if (_model.unfilteredRegionCall != null && _model.unfilteredRegionCall!.isNotEmpty) {
                                                      _model.businessList.clear();
                                                      _model.businessList = _model.unfilteredRegionCall!.toList().cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  } else {
                                                    _model.apiResultRegionInd = await BusinessTable().queryRows(
                                                      queryFn: (q) => q
                                                          .eqOrNull('industry', industry)
                                                          .eqOrNull('region', _model.dropDownValue2)
                                                          .order('created_at', ascending: false),
                                                    );
                                                    if (_model.apiResultRegionInd != null && _model.apiResultRegionInd!.isNotEmpty) {
                                                      _model.businessList.clear();
                                                      _model.businessList = _model.apiResultRegionInd!.toList().cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  }
                                                }
                                              },
                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.sourceSans3(),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                              selectedColor: FlutterFlowTheme.of(context).primary,
                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                                side: BorderSide(
                                                  color: FlutterFlowTheme.of(context).alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList()),
                                        // Region filter chips
                                        ...(_model.availableRegions.map((region) {
                                          return Padding(
                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                            child: FilterChip(
                                              label: Text(region),
                                              selected: _model.dropDownValue2 == region,
                                              onSelected: (selected) async {
                                                if (selected) {
                                                  safeSetState(() => _model.dropDownValue2 = region);

                                                  // Filter by region (and industry if selected)
                                                  if (_model.dropDownValue1 == null || _model.dropDownValue1 == 'All' || _model.dropDownValue1 == '') {
                                                    _model.apiResultRegionAll = await BusinessTable().queryRows(
                                                      queryFn: (q) => q.eqOrNull('region', region).order('created_at', ascending: false),
                                                    );
                                                    if (_model.apiResultRegionAll != null && _model.apiResultRegionAll!.isNotEmpty) {
                                                      _model.businessList.clear();
                                                      _model.businessList = _model.apiResultRegionAll!.toList().cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  } else {
                                                    _model.apiResultRegionInd = await BusinessTable().queryRows(
                                                      queryFn: (q) => q
                                                          .eqOrNull('industry', _model.dropDownValue1)
                                                          .eqOrNull('region', region)
                                                          .order('created_at', ascending: false),
                                                    );
                                                    if (_model.apiResultRegionInd != null && _model.apiResultRegionInd!.isNotEmpty) {
                                                      _model.businessList.clear();
                                                      _model.businessList = _model.apiResultRegionInd!.toList().cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  }
                                                }
                                              },
                                              labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                font: GoogleFonts.sourceSans3(),
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                              selectedColor: FlutterFlowTheme.of(context).primary,
                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                              elevation: 2.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0),
                                                side: BorderSide(
                                                  color: FlutterFlowTheme.of(context).alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList()),
                                        // Right padding
                                        SizedBox(width: 8.0),
                                      ],
                                    ),
                                  ),
'''

# Find the start of the filter section (line 630 - the Padding widget before the Row with dropdowns)
# and the end (after the second FlutterFlowDropDown and its closing widgets)
# Lines 630-1285 contain the entire filter dropdown section

start_line = 630 - 1  # Convert to 0-indexed
end_line = 1286 - 1    # Line after the filter section ends

# Replace the section
new_lines = lines[:start_line] + [new_filter_section] + lines[end_line:]

# Write back
with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    f.writelines(new_lines)

print("✓ Replaced dropdown filters with horizontal scrollable filter chips (LinkedIn style)")
print(f"✓ Removed {end_line - start_line + 1} lines, added {len(new_filter_section.splitlines())} lines")
print("✓ Filter chips will show: [All] [Industry1] [Industry2] ... [Region1] [Region2] ...")
