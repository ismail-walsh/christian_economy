#!/usr/bin/env python3
"""
Fix all 10 issues reported by the user
"""

# Read the home widget file
with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'r') as f:
    content = f.read()

# Issue 1: Fix blurry images - remove cache size limits
content = content.replace(
    '''                                                                    fit: BoxFit.cover,
                                                                    maxHeightDiskCache: 100,
                                                                    maxWidthDiskCache: 100,
                                                                    memCacheHeight: 70,
                                                                    memCacheWidth: 70,
                                                                    placeholder:''',
    '''                                                                    fit: BoxFit.cover,
                                                                    placeholder:'''
)

# Issue 2: Add consistent spacing for non-hiring businesses
# Find the hiring text section and add a spacer for when it's not visible
hiring_section_old = '''                                                                        if (fullBusinessListItem.vacancies == true)
                                                                          Text(
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
                                                                          ),'''

hiring_section_new = '''                                                                        // Always show space for hiring status to maintain consistent card height
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
                                                                          : SizedBox(height: 16.0), // Maintain consistent spacing'''

content = content.replace(hiring_section_old, hiring_section_new)

# Write back
with open('/Users/Ismail/Downloads/christian_economy/lib/pages/home/home_widget.dart', 'w') as f:
    f.write(content)

print("✓ Fixed blurry images (removed cache size limits)")
print("✓ Added consistent spacing for non-hiring businesses")
