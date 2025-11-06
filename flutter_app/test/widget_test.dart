import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:enterprise_flutter_app/src/core/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: EnterpriseApp(),
      ),
    );

    // Verify that the app launches without errors
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('Home page displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: EnterpriseApp(),
      ),
    );

    // Wait for the app to settle
    await tester.pumpAndSettle();

    // Verify welcome text is displayed
    expect(find.text('Welcome to Your\nEnterprise App'), findsOneWidget);
    expect(find.text('Production-ready • Enterprise-grade • Fortune 500'), findsOneWidget);
  });

  testWidgets('Navigation to dashboard works', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: EnterpriseApp(),
      ),
    );

    await tester.pumpAndSettle();

    // Find and tap the dashboard button
    final dashboardButton = find.text('Go to Dashboard');
    expect(dashboardButton, findsOneWidget);
    
    await tester.tap(dashboardButton);
    await tester.pumpAndSettle();

    // Verify we're on the dashboard page
    expect(find.text('Dashboard'), findsOneWidget);
  });
}
