#!/usr/bin/env python3
"""
Fix dropdown decoration - wrap FlutterFlowDropDown widgets in Container with decoration
instead of adding decoration parameter directly (which doesn't exist)
"""

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    content = f.read()

# Remove the decoration parameter that was incorrectly added to FlutterFlowDropDown
# And wrap the dropdown in a Container with decoration instead

# First dropdown (Industry)
old_dropdown1 = '''                                            child: FlutterFlowDropDown<String>(
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
                                              ),
                                              onChanged: (val) async {'''

new_dropdown1 = '''                                            child: Container(
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
                                              ),
                                              child: FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownValueController1 ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: [
                                                  'All',
                                                  ..._model.availableIndustries
                                                ],
                                                onChanged: (val) async {'''

content = content.replace(old_dropdown1, new_dropdown1)

# Need to add closing parenthesis for the Container at the end of the first dropdown
# Find the end of the first dropdown widget
content = content.replace(
    '''                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: FlutterFlowDropDown<String>(
                                              controller: _model
                                                      .dropDownValueController2 ??=
                                                  FormFieldController<String>(
                                                      null),
                                              options: [
                                                'All',
                                                ..._model.availableRegions
                                              ],
                                              decoration: BoxDecoration(''',
    '''                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 0.0, 0.0),
                                            child: Container(
                                              decoration: BoxDecoration('''
)

# Second dropdown (Region) - replace the decoration parameter section
content = content.replace(
    '''                                              decoration: BoxDecoration(
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
                                              ),
                                              onChanged: (val) async {''',
    '''                                                color: _model.dropDownValue2 != null && _model.dropDownValue2 != 'All'
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
                                              ),
                                              child: FlutterFlowDropDown<String>(
                                                controller: _model
                                                        .dropDownValueController2 ??=
                                                    FormFieldController<String>(
                                                        null),
                                                options: [
                                                  'All',
                                                  ..._model.availableRegions
                                                ],
                                                onChanged: (val) async {'''
)

# Add closing for second dropdown Container - find the end of second dropdown
# This is trickier, need to find the right closing location
lines = content.split('\n')
found_second_controller2 = False
for i, line in enumerate(lines):
    if 'dropDownValueController2' in line and not found_second_controller2:
        found_second_controller2 = True
        # Look for the closing of this dropdown (around 300-400 lines later)
        for j in range(i, min(i+500, len(lines))):
            # Find the pattern that marks end of second dropdown before the SizedBox
            if '                                              hidesUnderline: true,' in lines[j]:
                # Look for the closing bracket pattern after this
                for k in range(j, min(j+20, len(lines))):
                    if lines[k].strip() == '),':
                        # Check if next line is the SizedBox
                        if k+1 < len(lines) and 'SizedBox(width: 12.0)' in lines[k+1]:
                            # Add extra closing parenthesis before the SizedBox
                            lines[k] = lines[k] + '\n                                              ),' # Close Container
                            break
                break
        break

content = '\n'.join(lines)

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    f.write(content)

print("✓ Fixed dropdown decoration by wrapping in Container")
print("✓ Removed invalid decoration parameter from FlutterFlowDropDown")
print("✓ Both dropdowns now properly wrapped with conditional styling")
