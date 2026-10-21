import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _fishSpecies = [
    _FishSpecies(
      category: 'Tilapia',
      name: 'Nile Tilapia',
      scientificName: 'Oreochromis niloticus',
      commercialRole: 'Primary freshwater catch across lakes and reservoirs',
      imageAsset: 'assets/images/fish/nile_tilapia.jpg',
    ),
    _FishSpecies(
      category: 'Tilapia',
      name: 'Mozambique Tilapia',
      scientificName: 'Oreochromis mossambicus',
      commercialRole: 'Reservoir fishery',
      imageAsset: 'assets/images/fish/mozambique_tilapia.jpg',
    ),
    _FishSpecies(
      category: 'Exotic & Major Carps',
      name: 'Common Carp',
      scientificName: 'Cyprinus carpio',
      commercialRole: 'Commercial breeding & inland stocking',
      imageAsset: 'assets/images/fish/common_carp.jpg',
    ),
    _FishSpecies(
      category: 'Exotic & Major Carps',
      name: 'Grass Carp',
      scientificName: 'Ctenopharyngodon idella',
      commercialRole: 'Herbivorous control & commercial farm fish',
      imageAsset: 'assets/images/fish/grass_carp.jpg',
    ),
    _FishSpecies(
      category: 'Exotic & Major Carps',
      name: 'Bighead Carp',
      scientificName: 'Hypophthalmichthys nobilis',
      commercialRole: 'Reservoir fishery',
      imageAsset: 'assets/images/fish/bighead_carp.jpg',
    ),
    _FishSpecies(
      category: 'Exotic & Major Carps',
      name: 'Catla',
      scientificName: 'Labeo catla',
      commercialRole: 'Major Indian carp stocked in inland waters',
      imageAsset: 'assets/images/fish/catla.jpg',
    ),
    _FishSpecies(
      category: 'Exotic & Major Carps',
      name: 'Rohu',
      scientificName: 'Labeo rohita',
      commercialRole: 'Commercial freshwater food fish',
      imageAsset: 'assets/images/fish/rohu.jpg',
    ),
    _FishSpecies(
      category: 'Exotic & Major Carps',
      name: 'Mrigal',
      scientificName: 'Cirrhinus mrigala',
      commercialRole: 'Bottom-dwelling commercial carp',
      imageAsset: 'assets/images/fish/mrigal.jpg',
    ),
    _FishSpecies(
      category: 'Indigenous Food Fish',
      name: 'Green Chromide (Etroplus)',
      scientificName: 'Etroplus suratensis',
      commercialRole: 'Brackish/freshwater food fish (Karimeen / Pearlspot)',
      imageAsset: 'assets/images/fish/green_chromide.jpg',
    ),
    _FishSpecies(
      category: 'Indigenous Food Fish',
      name: 'Striped Snakehead',
      scientificName: 'Channa striata',
      commercialRole: 'Local inland fishing (Lula)',
      imageAsset: 'assets/images/fish/striped_snakehead.jpg',
    ),
    _FishSpecies(
      category: 'Indigenous Food Fish',
      name: 'Butter Catfish',
      scientificName: 'Ompok bimaculatus',
      commercialRole: 'Riverine fishery (Walaya)',
      imageAsset: 'assets/images/fish/butter_catfish.jpg',
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
                        'Fish Encyclopedia',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0C3D56),
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Learn about freshwater and brackish-water fish important to Sri Lanka.',
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
                              'Fish Species',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0C3D56),
                              ),
                            ),
                          ),
                          Text(
                            '${_fishSpecies.length} species',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF5D7381),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      for (final fish in _fishSpecies) ...[
                        _FishSpeciesCard(fish: fish),
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

class _FishSpeciesCard extends StatelessWidget {
  const _FishSpeciesCard({required this.fish});

  final _FishSpecies fish;

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
            if (fish.imageAsset case final imageAsset?)
              Image.asset(
                imageAsset,
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
              )
            else
              Container(
                height: 110,
                color: const Color(0xFFE6F5FA),
                child: const Icon(
                  Icons.set_meal_outlined,
                  color: Color(0xFF0B6D93),
                  size: 40,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fish.category,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                      color: Color(0xFF0B6D93),
                    ),
                  ),
                  const SizedBox(height: 5),
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
                    fish.commercialRole,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.35,
                      color: Color(0xFF405E6B),
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

class _FishSpecies {
  const _FishSpecies({
    required this.category,
    required this.name,
    required this.scientificName,
    required this.commercialRole,
    this.imageAsset,
  });

  final String category;
  final String name;
  final String scientificName;
  final String commercialRole;
  final String? imageAsset;
}

