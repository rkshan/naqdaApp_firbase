import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:naqda/firebase_options.dart';
import 'package:naqda/get_started_page.dart';
import 'package:naqda/login.dart';
import 'package:naqda/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NAQDA',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFdfeef3),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0a90b6)),
        useMaterial3: true,
      ),
      home: const GetStartedPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: 420,
            constraints: const BoxConstraints(maxWidth: 420),
            color: const Color(0xFFdfeef3),
            child: Column(
              children: [
                _buildTopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.height * 0.03),
                          _buildHeroArt(),
                          const SizedBox(height: 18),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFcfe4ee),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.fiber_manual_record, size: 13, color: Color(0xFF1d8fb3)),
                                SizedBox(width: 10),
                                Text(
                                  'WELCOME TO NAQDA',
                                  style: TextStyle(
                                    fontSize: 17,
                                    letterSpacing: 1.6,
                                    color: Color(0xFF1d8fb3),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            'Your aquaculture\njourney starts here.',
                            style: TextStyle(
                              fontSize: 38,
                              height: 0.98,
                              color: Color(0xFF0b3d4d),
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            'A world of aquatic possibility, closer to you. Take\nyour first step with NAQDA — together for a\nthriving aquatic future.',
                            style: TextStyle(
                              fontSize: 18,
                              height: 1.45,
                              color: Color(0xFF426a78),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: const [
                              _TagChip(label: 'Our waters.'),
                              _TagChip(label: 'Our communities.'),
                              _TagChip(label: 'Our future.'),
                            ],
                          ),
                          const SizedBox(height: 26),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                              decoration: BoxDecoration(
                                color: const Color(0xFF49b7d6),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF49b7d6).withValues(alpha: 0.35),
                                    blurRadius: 12,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Get Started',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward, color: Colors.white, size: 28),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              child: const Text.rich(
                                TextSpan(
                                  text: 'Already part of NAQDA? ',
                                  style: TextStyle(
                                    color: Color(0xFF3d5d68),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'Log in',
                                      style: TextStyle(
                                        color: Color(0xFF0b3d4d),
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 18),
                          Center(
                            child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 12,
                              runSpacing: 8,
                              children: [
                                const Icon(Icons.waves, color: Color(0xFF0b3d4d), size: 18),
                                SizedBox(
                                  width: 220,
                                  child: const Text(
                                    'Small beginnings. Lasting possibilities.',
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color(0xFF3d5d68),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(height: 1, color: Color(0xFFbfdbe3)),
                Container(
                  padding: const EdgeInsets.fromLTRB(22, 18, 22, 14),
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: 8,
                    children: [
                      const Text(
                        '© 2026 NAQDA. A fresher everyday.',
                        style: TextStyle(fontSize: 13, color: Color(0xFF476d7b)),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Privacy', style: TextStyle(fontSize: 13, color: Color(0xFF476d7b))),
                          SizedBox(width: 22),
                          Text('Terms', style: TextStyle(fontSize: 13, color: Color(0xFF476d7b))),
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

  Widget _buildTopBar() {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 10, 22, 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  color: Color(0xFF0f6d8d),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(Icons.anchor, size: 18, color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'NAQDA',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF155d76),
                  letterSpacing: -1.2,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: const Row(
              children: [
                Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF0a4f69),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 22, color: Color(0xFF0a4f69)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeroArt() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 320,
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFFc1dfe7).withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(180),
            ),
          ),
          Container(
            width: 220,
            height: 170,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F8F9),
              border: Border.all(color: const Color(0xFF0c7ea5), width: 2.2),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 150,
                    height: 110,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0e6988),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Transform.rotate(
                    angle: -0.22,
                    child: const Icon(Icons.shield_moon_rounded, size: 92, color: Color(0xFF1f2f43)),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    'NAQDA',
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF0d3b51),
                    ),
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

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFedf8fb),
        border: Border.all(color: const Color(0xFF8ab7c5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 15,
          color: Color(0xFF194d63),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
