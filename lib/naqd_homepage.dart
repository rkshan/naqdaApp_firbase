import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naqda/auth_error_message.dart';

class NaqdHomePage extends StatelessWidget {
  const NaqdHomePage({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    final name = user?.displayName;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7F9),
        foregroundColor: const Color(0xFF0C3D56),
        elevation: 0,
        title: const Text(
          'NAQDA Management',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        actions: [
          if (user != null)
            IconButton(
              tooltip: 'Sign out',
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  }
                } on FirebaseAuthException catch (error) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(authErrorMessage(error))),
                  );
                }
              },
              icon: const Icon(Icons.logout),
            ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: ListView(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
              children: [
                const Text(
                  'Welcome to the NAQDA portal',
                  style: TextStyle(
                    fontSize: 26,
                    height: 1.2,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0C3D56),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  name == null || name.isEmpty
                      ? 'Choose an area to manage.'
                      : 'Hello, $name. Choose an area to manage.',
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.5,
                    color: Color(0xFF5D7381),
                  ),
                ),
                const SizedBox(height: 28),
                _ManagementCard(
                  title: 'Manage Farmers',
                  description:
                      'Farmer management tools will be available here.',
                  icon: Icons.agriculture_outlined,
                ),
                const SizedBox(height: 16),
                _ManagementCard(
                  title: 'Manage Buyers',
                  description: 'Buyer management tools will be available here.',
                  icon: Icons.shopping_basket_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ManagementCard extends StatelessWidget {
  const _ManagementCard({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFDCE8ED)),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xFFE6F5FA),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: const Color(0xFF0B6D93), size: 27),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0C3D56),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    color: Color(0xFF5D7381),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
