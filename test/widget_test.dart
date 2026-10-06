import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:naqda/login.dart';
import 'package:naqda/role_selection.dart';

void main() {
  testWidgets('login page shows branding and form fields', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.text('Email address'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Log in'), findsWidgets);
  });

  testWidgets(
    'role selection shows all roles and enables continue after selection',
    (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: RoleSelectionPage()));

      expect(find.text('NAQDA'), findsOneWidget);
      expect(find.text('Farmers'), findsOneWidget);
      expect(find.text('Buyers'), findsOneWidget);
      expect(find.text('Guest User'), findsOneWidget);
      expect(
        tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNull,
      );

      await tester.tap(find.text('Farmers'));
      await tester.pumpAndSettle();

      expect(
        tester.widget<ElevatedButton>(find.byType(ElevatedButton)).onPressed,
        isNotNull,
      );

      await tester.ensureVisible(find.text('Continue'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Continue'));
      await tester.pumpAndSettle();

      expect(find.text('Role: Farmers'), findsOneWidget);
    },
  );
}
