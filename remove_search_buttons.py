#!/usr/bin/env python3
"""
Remove the search buttons that are now redundant
since we have search in the app bar
"""

import re

pages = [
    '/Users/Ismail/Downloads/christian_economy/lib/pages/my_businesses/my_businesses_widget.dart',
    '/Users/Ismail/Downloads/christian_economy/lib/pages/blacklist/blacklist_widget.dart',
    '/Users/Ismail/Downloads/christian_economy/lib/pages/jobs/jobs_widget.dart',
    '/Users/Ismail/Downloads/christian_economy/lib/pages/my_jobs/my_jobs_widget.dart',
]

for page_file in pages:
    print(f"\nProcessing {page_file.split('/')[-2]}...")

    with open(page_file, 'r') as f:
        lines = f.readlines()

    # Find and remove the StickyHeader with the search button
    # Look for "StickyHeader(" and find its matching closing parenthesis
    in_sticky_header = False
    sticky_start = -1
    paren_count = 0
    new_lines = []
    skip_until = -1

    for i, line in enumerate(lines):
        if skip_until >= i:
            continue

        # Look for StickyHeader with search button
        if 'StickyHeader(' in line and not in_sticky_header:
            # Check if next ~20 lines contain FFButtonWidget with Search
            lookahead = ''.join(lines[i:min(i+50, len(lines))])
            if 'Search...' in lookahead or 'SearchMyBusinessWidget' in lookahead or 'SearchBlacklistWidget' in lookahead or 'SearchJobWidget' in lookahead or 'SearchMyJobsWidget' in lookahead:
                in_sticky_header = True
                sticky_start = i
                paren_count = 1
                continue

        if in_sticky_header:
            # Count parentheses to find the end
            paren_count += line.count('(') - line.count(')')
            if paren_count == 0:
                # Found the end of StickyHeader
                in_sticky_header = False
                skip_until = i
                print(f"  ✓ Removed search button at lines {sticky_start+1}-{i+1}")
                continue

        if not in_sticky_header:
            new_lines.append(line)

    # Write back
    with open(page_file, 'w') as f:
        f.writelines(new_lines)

print("\n✓ All redundant search buttons removed!")
