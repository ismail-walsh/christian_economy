#!/usr/bin/env python3
"""
Redesign filter chips with:
- Two separate rows (Industries and Regions)
- Better colors and accessibility
- Smaller, more compact chips
- LinkedIn-style design
"""

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    lines = f.readlines()

# Find the start and end of the filter chips section
start_line = None
end_line = None

for i, line in enumerate(lines):
    if '// LinkedIn-style horizontal scrollable filter chips' in line:
        start_line = i
    if start_line and "'Christian businesses'," in line:
        end_line = i - 10  # Back up to before the Align
        break

# New filter design with two rows
new_filter_section = '''                                  // LinkedIn-style filter chips - Two rows for better visibility
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Industry filters row
                                      Container(
                                        width: double.infinity,
                                        height: 42.0,
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            SizedBox(width: 16.0),
                                            // Industry label chip (not selectable)
                                            Chip(
                                              label: Text('Industry:'),
                                              labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                font: GoogleFonts.sourceSans3(),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(16.0),
                                                side: BorderSide(
                                                  color: FlutterFlowTheme.of(context).alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            ),
                                            SizedBox(width: 8.0),
                                            // All industries chip
                                            FilterChip(
                                              label: Text('All'),
                                              selected: _model.dropDownValue1 == null || _model.dropDownValue1 == 'All',
                                              onSelected: (selected) async {
                                                if (selected) {
                                                  _model.dropDownValueController1?.reset();
                                                  safeSetState(() => _model.dropDownValue1 = null);

                                                  // Reload with region filter if set
                                                  if (_model.dropDownValue2 != null && _model.dropDownValue2 != 'All' && _model.dropDownValue2 != '') {
                                                    _model.apiResultRegionAll = await BusinessTable().queryRows(
                                                      queryFn: (q) => q.eqOrNull('region', _model.dropDownValue2).order('created_at', ascending: false),
                                                    );
                                                    if (_model.apiResultRegionAll != null && _model.apiResultRegionAll!.isNotEmpty) {
                                                      _model.businessList.clear();
                                                      _model.businessList = _model.apiResultRegionAll!.toList().cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  } else {
                                                    _model.allAllCall = await BusinessTable().queryRows(
                                                      queryFn: (q) => q.order('created_at', ascending: false),
                                                    );
                                                    if (_model.allAllCall != null && _model.allAllCall!.isNotEmpty) {
                                                      _model.businessList.clear();
                                                      _model.businessList = _model.allAllCall!.toList().cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  }
                                                }
                                              },
                                              labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                font: GoogleFonts.sourceSans3(),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                color: _model.dropDownValue1 == null || _model.dropDownValue1 == 'All'
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(context).primaryText,
                                              ),
                                              selectedColor: Color(0xFF0A66C2), // LinkedIn blue
                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                              checkmarkColor: Colors.white,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(16.0),
                                                side: BorderSide(
                                                  color: _model.dropDownValue1 == null || _model.dropDownValue1 == 'All'
                                                      ? Color(0xFF0A66C2)
                                                      : FlutterFlowTheme.of(context).alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            ),
                                            SizedBox(width: 8.0),
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
                                                  labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                    font: GoogleFonts.sourceSans3(),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    color: _model.dropDownValue1 == industry
                                                        ? Colors.white
                                                        : FlutterFlowTheme.of(context).primaryText,
                                                  ),
                                                  selectedColor: Color(0xFF0A66C2), // LinkedIn blue
                                                  backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                  checkmarkColor: Colors.white,
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(16.0),
                                                    side: BorderSide(
                                                      color: _model.dropDownValue1 == industry
                                                          ? Color(0xFF0A66C2)
                                                          : FlutterFlowTheme.of(context).alternate,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                                ),
                                              );
                                            }).toList()),
                                            SizedBox(width: 8.0),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      // Region filters row
                                      Container(
                                        width: double.infinity,
                                        height: 42.0,
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.horizontal,
                                          children: [
                                            SizedBox(width: 16.0),
                                            // Region label chip (not selectable)
                                            Chip(
                                              label: Text('Region:'),
                                              labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                font: GoogleFonts.sourceSans3(),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(16.0),
                                                side: BorderSide(
                                                  color: FlutterFlowTheme.of(context).alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            ),
                                            SizedBox(width: 8.0),
                                            // All regions chip
                                            FilterChip(
                                              label: Text('All'),
                                              selected: _model.dropDownValue2 == null || _model.dropDownValue2 == 'All',
                                              onSelected: (selected) async {
                                                if (selected) {
                                                  _model.dropDownValueController2?.reset();
                                                  safeSetState(() => _model.dropDownValue2 = null);

                                                  // Reload with industry filter if set
                                                  if (_model.dropDownValue1 != null && _model.dropDownValue1 != 'All' && _model.dropDownValue1 != '') {
                                                    _model.unfilteredRegionCall = await BusinessTable().queryRows(
                                                      queryFn: (q) => q.eqOrNull('industry', _model.dropDownValue1).order('created_at', ascending: false),
                                                    );
                                                    if (_model.unfilteredRegionCall != null && _model.unfilteredRegionCall!.isNotEmpty) {
                                                      _model.businessList.clear();
                                                      _model.businessList = _model.unfilteredRegionCall!.toList().cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  } else {
                                                    _model.allAllCall = await BusinessTable().queryRows(
                                                      queryFn: (q) => q.order('created_at', ascending: false),
                                                    );
                                                    if (_model.allAllCall != null && _model.allAllCall!.isNotEmpty) {
                                                      _model.businessList.clear();
                                                      _model.businessList = _model.allAllCall!.toList().cast<BusinessRow>();
                                                      safeSetState(() {});
                                                    }
                                                  }
                                                }
                                              },
                                              labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                font: GoogleFonts.sourceSans3(),
                                                fontSize: 12.0,
                                                letterSpacing: 0.0,
                                                color: _model.dropDownValue2 == null || _model.dropDownValue2 == 'All'
                                                    ? Colors.white
                                                    : FlutterFlowTheme.of(context).primaryText,
                                              ),
                                              selectedColor: Color(0xFF0A66C2), // LinkedIn blue
                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                              checkmarkColor: Colors.white,
                                              elevation: 0.0,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(16.0),
                                                side: BorderSide(
                                                  color: _model.dropDownValue2 == null || _model.dropDownValue2 == 'All'
                                                      ? Color(0xFF0A66C2)
                                                      : FlutterFlowTheme.of(context).alternate,
                                                  width: 1.0,
                                                ),
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                            ),
                                            SizedBox(width: 8.0),
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
                                                  labelStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                    font: GoogleFonts.sourceSans3(),
                                                    fontSize: 12.0,
                                                    letterSpacing: 0.0,
                                                    color: _model.dropDownValue2 == region
                                                        ? Colors.white
                                                        : FlutterFlowTheme.of(context).primaryText,
                                                  ),
                                                  selectedColor: Color(0xFF0A66C2), // LinkedIn blue
                                                  backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                  checkmarkColor: Colors.white,
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(16.0),
                                                    side: BorderSide(
                                                      color: _model.dropDownValue2 == region
                                                          ? Color(0xFF0A66C2)
                                                          : FlutterFlowTheme.of(context).alternate,
                                                      width: 1.0,
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                                ),
                                              );
                                            }).toList()),
                                            SizedBox(width: 8.0),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
'''

# Replace the section
new_lines = lines[:start_line] + [new_filter_section] + lines[end_line:]

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    f.writelines(new_lines)

print("✓ Redesigned filter chips with two rows")
print("✓ Improved accessibility (LinkedIn blue #0A66C2 with white text)")
print("✓ Smaller, more compact chips (12px font, 16px border radius)")
print("✓ Added 'Industry:' and 'Region:' label chips for clarity")
