import 'package:flutter/material.dart';
import 'package:naqda/login.dart';
import 'package:naqda/role_selection.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Keeps the screen centered and slightly constrained on larger devices.
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = screenWidth > 480 ? 420.0 : screenWidth;

    return Scaffold(
      // Background color matches the mockup and overall app theme.
      backgroundColor: const Color(0xFFF5F7F9),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: maxWidth,
            child: Column(
              children: [
                // Top bar with brand logo and login text.
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 14, 18, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 34,
                            height: 34,
                            child: Image.asset(
                              'assets/images/naqda.jpg',
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'NAQDA',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0E3E55),
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0B6D93),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 26),
                        // Main logo/branding card shown near the top of the screen.
                        Center(
                          child: SizedBox(
                            width: 260,
                            height: 210,
                            child: Image.asset(
                              'assets/images/naqda.jpg',
                              fit: BoxFit.contain,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        ),
                        const SizedBox(height: 22),
                        // Small label above the main headline.
                        const Text(
                          'WELCOME TO NAQDA',
                          style: TextStyle(
                            letterSpacing: 1.8,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF1A7DA3),
                          ),
                        ),
                        const SizedBox(height: 18),
                        // Main heading text matching the attached design.
                        const Text(
                          'Empowering Aquaculture and Breeding',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 28,
                            height: 0.95,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0C3D56),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Supporting description text under the heading.
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'A simple way to begin your journey with Sri Lanka\'s\naquaculture community.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              height: 1.5,
                              color: Color(0xFF5D7381),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        // Primary CTA button for beginning the user flow.
                        SizedBox(
                          width: double.infinity,
                          height: 68,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const RoleSelectionPage(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF66C2E9),
                              foregroundColor: const Color(0xFF0B3550),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Get started',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(Icons.arrow_forward_rounded, size: 28),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        // Existing account prompt shown just below the main button.
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF47687A),
                              ),
                            ),
                            SizedBox(width: 6),
                            Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF0B6D93),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Footer section with copyright and links.
                const Divider(height: 1, color: Color(0xFFB8CFDB)),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '© 2026 NAQDA',
                        style: TextStyle(
                          color: Color(0xFF5B7282),
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: const [
                          Text(
                            'Privacy',
                            style: TextStyle(
                              color: Color(0xFF5B7282),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(width: 18),
                          Text(
                            'Terms',
                            style: TextStyle(
                              color: Color(0xFF5B7282),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
