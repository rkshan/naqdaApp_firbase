import 'package:flutter/material.dart';
import 'package:naqda/login.dart';
import 'package:naqda/role_selection.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  static const _news = [
    _NewsStory(
      date: 'May 30, 2026',
      category: 'Community development',
      imageAsset: 'assets/images/news/community-training.jpeg',
      title:
          'NAQDA Successfully Completes Community Development Training Programme to Strengthen Public Sector Leadership',
      summary:
          'Eleven training programmes at NIFATI, Kalawewa helped more than 260 public sector officers strengthen leadership, teamwork and community engagement.',
      icon: Icons.groups_2_outlined,
    ),
    _NewsStory(
      date: 'August 05, 2025',
      category: 'Development project',
      imageAsset: 'assets/images/news/aqualivelihood.jpg',
      title:
          "Regional 'AquaLivelihood' Project to Empower 11,000 Small-Scale Fish Farming Families in Sri Lanka Launched",
      summary:
          'NAQDA and regional partners launched a project supporting small-scale fish farmers and strengthening nutritional security across South Asia.',
      icon: Icons.water_outlined,
    ),
    _NewsStory(
      date: 'July 22, 2025',
      category: 'Research partnership',
      imageAsset: 'assets/images/news/nara-research.jpg',
      title: 'Signed an MoU with NARA to carry out joint research activities',
      summary:
          'NAQDA and NARA will carry out joint research at the Kusala Bangadeniya Marine Ornamental Fish Research and Breeding Centre.',
      icon: Icons.science_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isWideLayout = MediaQuery.sizeOf(context).width >= 760;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F8F9),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context),
                  const SizedBox(height: 24),
                  _buildHero(context, isWideLayout),
                  const SizedBox(height: 48),
                  _buildNewsSection(),
                  const SizedBox(height: 36),
                  const Center(
                    child: Text(
                      '© 2026 National Aquaculture Development Authority of Sri Lanka',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF657D86),
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/naqda.jpg',
          width: 42,
          height: 42,
          fit: BoxFit.contain,
          semanticLabel: 'NAQDA Sri Lanka logo',
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NAQDA',
              style: TextStyle(
                color: Color(0xFF0C3D56),
                fontSize: 19,
                fontWeight: FontWeight.w900,
                letterSpacing: 0.6,
              ),
            ),
            Text(
              'SRI LANKA',
              style: TextStyle(
                color: Color(0xFF66818B),
                fontSize: 9,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.7,
              ),
            ),
          ],
        ),
        const Spacer(),
        TextButton.icon(
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const LoginPage())),
          icon: const Icon(Icons.login_rounded, size: 18),
          label: const Text('Log in'),
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF0B6D93),
            textStyle: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _buildHero(BuildContext context, bool isWideLayout) {
    final heroCopy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: const Color(0xFFDCEFF2),
            borderRadius: BorderRadius.circular(30),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.waves_rounded, size: 17, color: Color(0xFF087C91)),
              SizedBox(width: 7),
              Text(
                'EMPOWERING RURAL LIVELIHOODS',
                style: TextStyle(
                  color: Color(0xFF087C91),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Text(
          'Aquaculture for a thriving Sri Lanka.',
          style: TextStyle(
            color: const Color(0xFF0C3D56),
            fontSize: isWideLayout ? 44 : 36,
            height: 1.08,
            fontWeight: FontWeight.w900,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 14),
        const Text(
          'Discover how NAQDA supports sustainable aquaculture, inland fish production and food security for communities across Sri Lanka.',
          style: TextStyle(color: Color(0xFF526F7B), fontSize: 15, height: 1.6),
        ),
        const SizedBox(height: 22),
        FilledButton.icon(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RoleSelectionPage()),
          ),
          icon: const Icon(Icons.arrow_forward_rounded),
          label: const Text('Get started'),
          style: FilledButton.styleFrom(
            backgroundColor: const Color(0xFF087C91),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ],
    );

    final heroImage = ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: AspectRatio(
        aspectRatio: isWideLayout ? 1.18 : 1.8,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/fish/nile_tilapia.jpg',
              fit: BoxFit.cover,
              semanticLabel: 'Nile tilapia, an important freshwater fish',
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Color(0xCC062B3A)],
                  stops: [0.35, 1],
                ),
              ),
            ),
            const Positioned(
              left: 18,
              right: 18,
              bottom: 18,
              child: Text(
                'Sustainable aquaculture. Stronger communities.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  height: 1.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return Container(
      padding: EdgeInsets.all(isWideLayout ? 36 : 22),
      decoration: BoxDecoration(
        color: const Color(0xFFEAF4F4),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: const Color(0xFFD9E9E9)),
      ),
      child: isWideLayout
          ? Row(
              children: [
                Expanded(flex: 11, child: heroCopy),
                const SizedBox(width: 36),
                Expanded(flex: 9, child: heroImage),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [heroCopy, const SizedBox(height: 24), heroImage],
            ),
    );
  }

  Widget _buildNewsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'LATEST UPDATES',
          style: TextStyle(
            color: Color(0xFF087C91),
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.6,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'NAQDA News',
          style: TextStyle(
            color: Color(0xFF0C3D56),
            fontSize: 30,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'The latest updates on aquaculture development and initiatives.',
          style: TextStyle(color: Color(0xFF617A83), fontSize: 14, height: 1.5),
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final useColumns = constraints.maxWidth >= 820;
            final cardWidth = useColumns
                ? (constraints.maxWidth - 32) / 3
                : constraints.maxWidth;
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                for (final story in _news)
                  SizedBox(
                    width: cardWidth,
                    child: _NewsCard(story: story),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _NewsCard extends StatelessWidget {
  const _NewsCard({required this.story});

  final _NewsStory story;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE0EAEC)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0B0C3D56),
            blurRadius: 18,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Image.asset(
              story.imageAsset,
              key: ValueKey('news-photo-${story.category}'),
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
              semanticLabel: story.title,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F4F4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(story.icon, color: const Color(0xFF087C91)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  story.category,
                  style: const TextStyle(
                    color: Color(0xFF087C91),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            story.title,
            style: const TextStyle(
              color: Color(0xFF123F52),
              fontSize: 16,
              height: 1.35,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            story.summary,
            style: const TextStyle(
              color: Color(0xFF5C747E),
              fontSize: 13,
              height: 1.55,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(
                Icons.calendar_today_outlined,
                color: Color(0xFF789098),
                size: 14,
              ),
              const SizedBox(width: 7),
              Text(
                story.date,
                style: const TextStyle(
                  color: Color(0xFF789098),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NewsStory {
  const _NewsStory({
    required this.date,
    required this.category,
    required this.imageAsset,
    required this.title,
    required this.summary,
    required this.icon,
  });

  final String date;
  final String category;
  final String imageAsset;
  final String title;
  final String summary;
  final IconData icon;
}
