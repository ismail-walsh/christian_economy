#!/usr/bin/env python3
"""
Fix multiple issues:
1. Add green circle icon before hiring text
2. Change hiring text to Row with icon
"""

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    content = f.read()

# Fix: Add green circle icon before hiring text and make it a Row
old_hiring = '''                                                                      // Hiring status (with consistent spacing)
                                                                      fullBusinessListItem.vacancies == true
                                                                        ? Text(
                                                                            'Hiring',
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                              font: GoogleFonts.sourceSans3(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                              color: Color(0xFF059669), // Green for better visibility in dark mode
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                            ),
                                                                          )
                                                                        : SizedBox(height: 16.0), // Consistent spacing'''

new_hiring = '''                                                                      // Hiring status (with consistent spacing)
                                                                      fullBusinessListItem.vacancies == true
                                                                        ? Row(
                                                                            mainAxisSize: MainAxisSize.min,
                                                                            children: [
                                                                              Container(
                                                                                width: 8.0,
                                                                                height: 8.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFF059669), // Green circle
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                              ),
                                                                              SizedBox(width: 4.0),
                                                                              Text(
                                                                                'Hiring',
                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.sourceSans3(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  color: Color(0xFF059669), // Green for better visibility in dark mode
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        : SizedBox(height: 16.0), // Consistent spacing'''

content = content.replace(old_hiring, new_hiring)

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    f.write(content)

print("✓ Added green circle icon before hiring text")
print("✓ Changed hiring text to Row with icon")
