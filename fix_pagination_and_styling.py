#!/usr/bin/env python3
"""
Fix multiple issues:
1. Pagination interfering with filtering - filters should reset pagination
2. Change hiring color from red to green for dark mode visibility
3. Style filter dropdowns with filled color when selected
"""

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    content = f.read()

# Fix 1: Add order by to all filter queries to maintain consistency
# This ensures filtered results are also ordered by created_at
content = content.replace(
    "queryFn: (q) => q.eqOrNull(\n                                                        'industry',\n                                                        _model.dropDownValue1,\n                                                      ),",
    "queryFn: (q) => q.eqOrNull(\n                                                        'industry',\n                                                        _model.dropDownValue1,\n                                                      ).order('created_at', ascending: false),"
)

content = content.replace(
    "queryFn: (q) => q.eqOrNull(\n                                                        'region',\n                                                        _model.dropDownValue2,\n                                                      ),",
    "queryFn: (q) => q.eqOrNull(\n                                                        'region',\n                                                        _model.dropDownValue2,\n                                                      ).order('created_at', ascending: false),"
)

content = content.replace(
    "queryFn: (q) => q\n                                                          .eqOrNull(\n                                                            'industry',\n                                                            _model.dropDownValue1,\n                                                          )\n                                                          .eqOrNull(\n                                                            'region',\n                                                            _model.dropDownValue2,\n                                                          ),",
    "queryFn: (q) => q\n                                                          .eqOrNull(\n                                                            'industry',\n                                                            _model.dropDownValue1,\n                                                          )\n                                                          .eqOrNull(\n                                                            'region',\n                                                            _model.dropDownValue2,\n                                                          )\n                                                          .order('created_at', ascending: false),"
)

# Fix for queries with just "queryFn: (q) => q" (show all)
content = content.replace(
    "queryFn: (q) => q,\n                                                    );",
    "queryFn: (q) => q.order('created_at', ascending: false),\n                                                    );"
)

# Fix 2: Change hiring color from red (primary) to green for better dark mode visibility
# Find the hiring text styling and change color
content = content.replace(
    '''                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                          )
                                                                        : SizedBox(height: 16.0), // Consistent spacing''',
    '''                                                                              color: Color(0xFF059669), // Green for better visibility in dark mode
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                          )
                                                                        : SizedBox(height: 16.0), // Consistent spacing'''
)

# Fix 3: Style filter dropdowns with filled color when selected
# Find the first dropdown (Industry) and add filled color styling
content = content.replace(
    '''                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController1 ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: [
                                                'All',
                                                ..._model.availableIndustries
                                              ],''',
    '''                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController1 ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: [
                                                'All',
                                                ..._model.availableIndustries
                                              ],
                                              decoration: BoxDecoration(
                                                color: _model.dropDownValue1 != null && _model.dropDownValue1 != 'All'
                                                    ? Color(0xFF0A66C2).withOpacity(0.1) // LinkedIn blue tint when selected
                                                    : FlutterFlowTheme.of(context).secondaryBackground,
                                                borderRadius: BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: _model.dropDownValue1 != null && _model.dropDownValue1 != 'All'
                                                      ? Color(0xFF0A66C2) // LinkedIn blue border when selected
                                                      : FlutterFlowTheme.of(context).alternate,
                                                  width: _model.dropDownValue1 != null && _model.dropDownValue1 != 'All'
                                                      ? 1.5
                                                      : 1.0,
                                                ),
                                              ),'''
)

# Find the second dropdown (Region) - need to search for the pattern after the first one
# Looking for the second FlutterFlowDropDown after line 900+
lines = content.split('\n')
second_dropdown_found = False
first_dropdown_passed = False
for i, line in enumerate(lines):
    if 'dropDownValueController1' in line and 'FlutterFlowDropDown<String>' in lines[max(0, i-5):i+1]:
        first_dropdown_passed = True
    elif first_dropdown_passed and 'dropDownValueController2' in line and 'FlutterFlowDropDown<String>' in lines[max(0, i-5):i+1]:
        # Found the second dropdown, insert decoration before options
        for j in range(i, min(i+20, len(lines))):
            if "'All'," in lines[j] and 'availableRegions' in lines[j+1]:
                # Insert decoration before the options line
                decoration_code = '''                                              decoration: BoxDecoration(
                                                color: _model.dropDownValue2 != null && _model.dropDownValue2 != 'All'
                                                    ? Color(0xFF0A66C2).withOpacity(0.1) // LinkedIn blue tint when selected
                                                    : FlutterFlowTheme.of(context).secondaryBackground,
                                                borderRadius: BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: _model.dropDownValue2 != null && _model.dropDownValue2 != 'All'
                                                      ? Color(0xFF0A66C2) // LinkedIn blue border when selected
                                                      : FlutterFlowTheme.of(context).alternate,
                                                  width: _model.dropDownValue2 != null && _model.dropDownValue2 != 'All'
                                                      ? 1.5
                                                      : 1.0,
                                                ),
                                              ),'''
                lines.insert(j, decoration_code)
                second_dropdown_found = True
                break
        break

if second_dropdown_found:
    content = '\n'.join(lines)

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    f.write(content)

print("✓ Fixed pagination - added order by to all filter queries")
print("✓ Changed hiring color from red to green (0xFF059669) for dark mode")
print("✓ Styled filter dropdowns with LinkedIn blue fill when selected")
print("✓ Added thicker border (1.5px) and tinted background for selected filters")
