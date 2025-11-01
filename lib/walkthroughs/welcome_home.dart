import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthrough/home/home_card_welcome/home_card_welcome_widget.dart';
import '/walkthrough/home/home_card_search/home_card_search_widget.dart';
import '/walkthrough/home/home_card_priority/home_card_priority_widget.dart';
import '/walkthrough/home/home_card_tabs/home_card_tabs_widget.dart';
import '/walkthrough/home/home_card_business_card/home_card_business_card_widget.dart';

// Focus widget keys for this walkthrough
final textR9p2mjp1 = GlobalKey();
final textFieldTqhimnvm = GlobalKey();
final listViewCamtt8j2 = GlobalKey();
final containerBo98dzdm = GlobalKey();
final columnIisrklu0 = GlobalKey();

/// Welcome Home
///
/// Get to know the app and learn how it works
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: textR9p2mjp1,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HomeCardWelcomeWidget(
              blacklistId: 0,
            ),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: textFieldTqhimnvm,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HomeCardSearchWidget(
              blacklistId: 0,
            ),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: listViewCamtt8j2,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HomeCardPriorityWidget(
              blacklistId: 0,
            ),
          ),
        ],
      ),

      /// Step 4
      TargetFocus(
        keyTarget: containerBo98dzdm,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => HomeCardTabsWidget(
              blacklistId: 0,
            ),
          ),
        ],
      ),

      /// Step 5
      TargetFocus(
        keyTarget: columnIisrklu0,
        enableOverlayTab: true,
        alignSkip: Alignment.topRight,
        shape: ShapeLightFocus.RRect,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => HomeCardBusinessCardWidget(
              blacklistId: 0,
            ),
          ),
        ],
      ),
    ];
