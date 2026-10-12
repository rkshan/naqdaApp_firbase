import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:naqda/login.dart';
import 'package:naqda/home_page.dart';
import 'package:naqda/role_selection.dart';

void main() {
  testWidgets('home page shows fish breeding encyclopedia', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    expect(find.byKey(const ValueKey('home-brand-logo')), findsOneWidget);
    await tester.drag(find.byType(CustomScrollView), const Offset(0, -700));
    await tester.pumpAndSettle();
    expect(find.text('Fish Encyclopedia'), findsOneWidget);
    expect(find.text('Fishes for Breeding'), findsOneWidget);

    for (final fishName in ['Nile tilapia', 'Common carp', 'Rohu', 'Catla']) {
      await tester.ensureVisible(find.text(fishName));
      await tester.pumpAndSettle();
      expect(find.text(fishName), findsOneWidget);
      expect(find.byKey(ValueKey('fish-photo-$fishName')), findsOneWidget);
    }
  });

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

  testWidgets('guest selection opens the home page without sign-up', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) => Scaffold(
            body: Column(
              children: [
                const Text('Public welcome'),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const RoleSelectionPage(),
                      ),
                    );
                  },
                  child: const Text('Open roles'),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Open roles'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Guest User'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Continue'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to NAQDA'), findsOneWidget);
    expect(find.text('GUEST'), findsOneWidget);
    expect(find.text('Explore'), findsOneWidget);
    expect(find.text('Public welcome'), findsNothing);
    expect(find.text('Create Account'), findsNothing);
  });
}
