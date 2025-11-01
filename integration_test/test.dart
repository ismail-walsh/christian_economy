import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:christian_economy/flutter_flow/flutter_flow_drop_down.dart';
import 'package:christian_economy/flutter_flow/flutter_flow_icon_button.dart';
import 'package:christian_economy/flutter_flow/flutter_flow_widgets.dart';
import 'package:christian_economy/flutter_flow/flutter_flow_theme.dart';
import 'package:christian_economy/index.dart';
import 'package:christian_economy/main.dart';
import 'package:christian_economy/flutter_flow/flutter_flow_util.dart';

import 'package:christian_economy/backend/firebase/firebase_config.dart';

import 'package:christian_economy/backend/supabase/supabase.dart';
import 'package:christian_economy/auth/supabase_auth/auth_util.dart';

import 'package:christian_economy/backend/supabase/supabase.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
    await SupaFlow.initialize();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
  });

  testWidgets('login success', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MyApp(
      entryPage: LoginWidget(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.enterText(
        find.byKey(const ValueKey('emailAddress_j8kl')), 'test@gmail.com');
    await tester.enterText(
        find.byKey(const ValueKey('password_l1fo')), 'testing123');
    await tester.pumpAndSettle(const Duration(milliseconds: 200));
    expect(find.byKey(const ValueKey('Text_zzwp')), findsWidgets);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
