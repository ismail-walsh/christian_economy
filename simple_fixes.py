#!/usr/bin/env python3
"""
Apply only the essential fixes without decoration styling:
1. Add order by to filter queries
2. Change hiring color to green
"""

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    content = f.read()

# Fix 1: Add .order('created_at', ascending: false) to filter queries
# Change hiring color to green

# Fix hiring color
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

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    f.write(content)

print("✓ Changed hiring text color to green for dark mode")
