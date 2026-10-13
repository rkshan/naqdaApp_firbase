import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _sections = [
    _HomeSection(
      title: 'Aquaculture',
      description: 'Learn about aquaculture and breeding in Sri Lanka.',
      icon: Icons.water,
    ),
    _HomeSection(
      title: 'Farmers',
      description: 'Discover resources for fish farmers and producers.',
      icon: Icons.agriculture_outlined,
    ),
    _HomeSection(
      title: 'Marketplace',
      description: 'Explore local suppliers and aquaculture products.',
      icon: Icons.shopping_basket_outlined,
    ),
  ];

  static const _breedingFish = [
    _BreedingFish(
      name: 'Nile tilapia',
      scientificName: 'Oreochromis niloticus',
      description:
          'A hardy freshwater fish commonly raised in ponds and tanks.',
      breedingNote: 'Known for frequent spawning in warm water.',
      imageAsset: 'assets/images/fish/nile_tilapia.jpg',
    ),
    _BreedingFish(
      name: 'Common carp',
      scientificName: 'Cyprinus carpio',
      description:
          'A widely farmed freshwater species that adapts to pond culture.',
      breedingNote: 'Breeding is commonly managed in fish hatcheries.',
      imageAsset: 'assets/images/fish/common_carp.jpg',
    ),
    _BreedingFish(
      name: 'Rohu',
      scientificName: 'Labeo rohita',
      description:
          'A freshwater carp often raised in mixed-species pond systems.',
      breedingNote: 'Seed is typically produced through hatchery breeding.',
      imageAsset: 'assets/images/fish/rohu.jpg',
    ),
    _BreedingFish(
      name: 'Catla',
      scientificName: 'Catla catla',
      description:
          'A fast-growing freshwater carp raised in warm-water aquaculture.',
      breedingNote: 'Hatchery-produced seed is commonly used for farming.',
      imageAsset: 'assets/images/fish/catla.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/naqda.jpg',
                            key: const ValueKey('home-brand-logo'),
                            width: 46,
                            height: 46,
                            fit: BoxFit.contain,
                            semanticLabel: 'NAQDA Sri Lanka logo',
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'NAQDA',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                              color: Color(0xFF0C3D56),
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6F5FA),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'GUEST',
                              style: TextStyle(
                                color: Color(0xFF0B6D93),
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 36),
                      const Text(
                        'Welcome to NAQDA',
                        style: TextStyle(
                          fontSize: 30,
                          height: 1.15,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0C3D56),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Explore Sri Lanka’s aquaculture community and discover what NAQDA has to offer.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          color: Color(0xFF5D7381),
                        ),
                      ),
                      const SizedBox(height: 28),
                      const Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0C3D56),
                        ),
                      ),
                      const SizedBox(height: 14),
                      for (final section in _sections) ...[
                        _HomeSectionCard(section: section),
                        const SizedBox(height: 12),
                      ],
                      const SizedBox(height: 20),
                      const Text(
                        'Fish Encyclopedia',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0C3D56),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Explore freshwater species raised in aquaculture.',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                          color: Color(0xFF5D7381),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          const Expanded(
                            child: Text(
                              'Fishes for Breeding',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0C3D56),
                              ),
                            ),
                          ),
                          Text(
                            '${_breedingFish.length} species',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF5D7381),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      for (final fish in _breedingFish) ...[
                        _BreedingFishCard(fish: fish),
                        const SizedBox(height: 12),
                      ],
                    ]),
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

class _BreedingFishCard extends StatelessWidget {
  const _BreedingFishCard({required this.fish});

  final _BreedingFish fish;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDCE8ED)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              fish.imageAsset,
              key: ValueKey('fish-photo-${fish.name}'),
              height: 170,
              fit: BoxFit.cover,
              semanticLabel: '${fish.name} photo',
              errorBuilder: (context, error, stackTrace) => Container(
                height: 170,
                color: const Color(0xFFE6F5FA),
                child: const Icon(
                  Icons.image_not_supported_outlined,
                  color: Color(0xFF0B6D93),
                  size: 40,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fish.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0C3D56),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    fish.scientificName,
                    style: const TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Color(0xFF5D7381),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    fish.description,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.35,
                      color: Color(0xFF405E6B),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Breeding: ${fish.breedingNote}',
                    style: const TextStyle(
                      fontSize: 12,
                      height: 1.35,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF0B6D93),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BreedingFish {
  const _BreedingFish({
    required this.name,
    required this.scientificName,
    required this.description,
    required this.breedingNote,
    required this.imageAsset,
  });

  final String name;
  final String scientificName;
  final String description;
  final String breedingNote;
  final String imageAsset;
}

class _HomeSectionCard extends StatelessWidget {
  const _HomeSectionCard({required this.section});

  final _HomeSection section;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDCE8ED)),
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFEEF6F8),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(section.icon, color: const Color(0xFF0B6D93)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  section.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF0C3D56),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  section.description,
                  style: const TextStyle(
                    fontSize: 13,
                    height: 1.35,
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

class _HomeSection {
  const _HomeSection({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}
