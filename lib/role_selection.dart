import 'package:flutter/material.dart';
import 'package:naqda/signup.dart';

class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({super.key});

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  String? _selectedRole;

  static const _roles = [
    _RoleOption(
      name: 'NAQDA',
      description: 'Government and organization access',
      icon: Icons.account_balance_outlined,
    ),
    _RoleOption(
      name: 'Farmers',
      description: 'Manage your farm and aquaculture activities',
      icon: Icons.agriculture_outlined,
    ),
    _RoleOption(
      name: 'Buyers',
      description: 'Discover and connect with local suppliers',
      icon: Icons.shopping_basket_outlined,
    ),
    _RoleOption(
      name: 'Guest User',
      description: 'Explore the NAQDA community',
      icon: Icons.person_outline,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F9),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F7F9),
        foregroundColor: const Color(0xFF0C3D56),
        elevation: 0,
        title: const Text(
          'Choose your role',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'How will you use NAQDA?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF0C3D56),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Select the role that best describes you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF5D7381),
                    ),
                  ),
                  const SizedBox(height: 26),
                  for (final role in _roles) ...[
                    _buildRoleCard(role),
                    const SizedBox(height: 12),
                  ],
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _selectedRole == null
                          ? null
                          : () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(
                                    selectedRole: _selectedRole,
                                  ),
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF66C2E9),
                        disabledBackgroundColor: const Color(0xFFD7E4E9),
                        foregroundColor: const Color(0xFF0B3550),
                        disabledForegroundColor: const Color(0xFF78909C),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward_rounded),
                        ],
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

  Widget _buildRoleCard(_RoleOption role) {
    final isSelected = _selectedRole == role.name;

    return Semantics(
      button: true,
      selected: isSelected,
      label: '${role.name}. ${role.description}',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => setState(() => _selectedRole = role.name),
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFFE6F5FA) : Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF1684A8)
                    : const Color(0xFFDCE8ED),
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFD1EFF7)
                        : const Color(0xFFEEF6F8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    role.icon,
                    color: const Color(0xFF0B6D93),
                    size: 25,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF0C3D56),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        role.description,
                        style: const TextStyle(
                          fontSize: 12,
                          height: 1.35,
                          color: Color(0xFF5D7381),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_unchecked,
                  color: isSelected
                      ? const Color(0xFF1684A8)
                      : const Color(0xFF9AAEB7),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RoleOption {
  const _RoleOption({
    required this.name,
    required this.description,
    required this.icon,
  });

  final String name;
  final String description;
  final IconData icon;
}
