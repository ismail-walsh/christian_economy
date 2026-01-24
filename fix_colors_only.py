#!/usr/bin/env python3
"""
Fix colors first, then we'll do YouTube redesign separately:
1. Fix FAB to use primaryText color with secondaryBackground
2. Fix navbar tab to use primaryText color
"""

# Fix 1: Change FAB to primaryText color with secondaryBackground
with open('/Users/Ismail/Downloads/christian_economy/lib/pages/my_businesses/my_businesses_widget.dart', 'r') as f:
    content = f.read()

old_fab = '''            backgroundColor: FlutterFlowTheme.of(context).tertiary,
            icon: Icon(
              Icons.add_business,
              color: Colors.white,'''

new_fab = '''            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            icon: Icon(
              Icons.add_business,
              color: FlutterFlowTheme.of(context).primaryText,'''

content = content.replace(old_fab, new_fab)

old_fab_text = '''                color: Colors.white,
                fontSize: 16.0,'''

new_fab_text = '''                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 16.0,'''

content = content.replace(old_fab_text, new_fab_text)

with open('/Users/Ismail/Downloads/christian_economy/lib/pages/my_businesses/my_businesses_widget.dart', 'w') as f:
    f.write(content)

print("✓ Fixed FAB to use primaryText color (adapts to dark mode)")

# Fix 2: Change navbar tab indicator to primaryText
with open('/Users/Ismail/Downloads/christian_economy/lib/main.dart', 'r') as f:
    content = f.read()

content = content.replace(
    '''            color: Colors.black,
            borderRadius: BorderRadius.circular(1.5),''',
    '''            color: FlutterFlowTheme.of(context).primaryText,
            borderRadius: BorderRadius.circular(1.5),'''
)

with open('/Users/Ismail/Downloads/christian_economy/lib/main.dart', 'w') as f:
    f.write(content)

print("✓ Fixed navbar tab indicator to use primaryText color (adapts to dark mode)")
