import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:naqda/login.dart';
import 'package:naqda/home_page.dart';
import 'package:naqda/naqd_homepage.dart';
import 'package:naqda/role_selection.dart';
import 'package:naqda/signup.dart';

void main() {
  testWidgets('home page shows fish encyclopedia species', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    expect(find.byKey(const ValueKey('home-brand-logo')), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Fish Encyclopedia'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();
    expect(find.text('Fish Encyclopedia'), findsOneWidget);
    expect(find.text('Fish Species'), findsOneWidget);
    expect(find.text('11 species'), findsOneWidget);

    const species = [
      ('Nile Tilapia', 'Oreochromis niloticus'),
      ('Mozambique Tilapia', 'Oreochromis mossambicus'),
      ('Common Carp', 'Cyprinus carpio'),
      ('Grass Carp', 'Ctenopharyngodon idella'),
      ('Bighead Carp', 'Hypophthalmichthys nobilis'),
      ('Catla', 'Labeo catla'),
      ('Rohu', 'Labeo rohita'),
      ('Mrigal', 'Cirrhinus mrigala'),
      ('Green Chromide (Etroplus)', 'Etroplus suratensis'),
      ('Striped Snakehead', 'Channa striata'),
      ('Butter Catfish', 'Ompok bimaculatus'),
    ];
    const picturedFish = {
      'Nile Tilapia',
      'Mozambique Tilapia',
      'Common Carp',
      'Grass Carp',
      'Bighead Carp',
      'Catla',
      'Rohu',
      'Mrigal',
      'Green Chromide (Etroplus)',
      'Striped Snakehead',
      'Butter Catfish',
    };

    for (final (fishName, scientificName) in species) {
      await tester.scrollUntilVisible(
        find.text(fishName),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.pumpAndSettle();
      expect(find.text(fishName), findsOneWidget);
      expect(find.text(scientificName), findsOneWidget);
      if (picturedFish.contains(fishName)) {
        expect(find.byKey(ValueKey('fish-photo-$fishName')), findsOneWidget);
      }
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

  testWidgets('login validates required fields before authentication', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();

    expect(find.text('Enter your email address.'), findsOneWidget);
    expect(find.text('Enter your password.'), findsOneWidget);
  });

  testWidgets('NAQDA login does not offer a signup shortcut', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: LoginPage(selectedRole: 'NAQDA')),
    );

    expect(find.text('Welcome back, NAQDA'), findsOneWidget);
    expect(find.text('Sign up'), findsNothing);
  });

  testWidgets('farmer and buyer login screens keep their selected roles', (
    WidgetTester tester,
  ) async {
    for (final role in ['Farmers', 'Buyers']) {
      await tester.pumpWidget(const SizedBox.shrink());
      await tester.pump();
      await tester.pumpWidget(MaterialApp(home: LoginPage(selectedRole: role)));

      expect(find.text('Log in - $role'), findsOneWidget);
      expect(find.text('Welcome back, $role'), findsOneWidget);
      await tester.ensureVisible(find.text('Sign up'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Sign up'));
      await tester.pumpAndSettle();
      expect(find.text('Role: $role'), findsOneWidget);
    }
  });

  testWidgets('signup validates account fields before authentication', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const MaterialApp(home: SignUpPage(selectedRole: 'Farmers')),
    );

    expect(find.text('Role: Farmers'), findsOneWidget);
    await tester.ensureVisible(find.byType(ElevatedButton).first);
    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();

    expect(find.text('Enter your full name.'), findsOneWidget);
    expect(find.text('Enter your email address.'), findsOneWidget);
    expect(find.text('Create a password.'), findsOneWidget);
  });

  testWidgets('NAQDA management page shows farmer and buyer options', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: NaqdHomePage()));

    expect(find.text('NAQDA Management'), findsOneWidget);
    expect(find.text('Manage Farmers'), findsOneWidget);
    expect(find.text('Manage Buyers'), findsOneWidget);
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
    expect(find.text('Explore'), findsNothing);
    expect(find.text('Aquaculture'), findsNothing);
    expect(find.text('Marketplace'), findsNothing);
    expect(find.text('Public welcome'), findsNothing);
    expect(find.text('Create Account'), findsNothing);
  });
}
