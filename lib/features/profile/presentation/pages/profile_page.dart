import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:trainer_manager_pro/core/constants/app_constants.dart';
import 'package:trainer_manager_pro/features/auth/presentation/controllers/auth_controller.dart';
import 'package:trainer_manager_pro/shared/presentation/widgets/app_bottom_navigation.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _showEditProfileDialog(context),
          ),
        ],
      ),
      body: _buildProfileContent(context, theme, authState),
      bottomNavigationBar: const AppBottomNavigation(),
    );
  }

  Widget _buildProfileContent(BuildContext context, ThemeData theme, AsyncValue authState) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(theme),
          const SizedBox(height: 32),
          _buildStatsSection(theme),
          const SizedBox(height: 32),
          _buildProfileOptions(context, theme),
          const SizedBox(height: 32),
          _buildAppSettings(context, theme),
          const SizedBox(height: 32),
          _buildLogoutSection(context, theme),
        ],
      ),
    );
  }

  Widget _buildProfileHeader(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: theme.primaryColor,
              child: const Text(
                'T',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trainer Pro',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'test@gmail.com',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Verified Trainer',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
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

  Widget _buildStatsSection(ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Statistics',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                theme: theme,
                title: 'Total Students',
                value: '25',
                icon: Icons.people,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                theme: theme,
                title: 'Active Classes',
                value: '8',
                icon: Icons.fitness_center,
                color: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildStatCard(
                theme: theme,
                title: 'Diet Plans',
                value: '12',
                icon: Icons.restaurant_menu,
                color: Colors.orange,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildStatCard(
                theme: theme,
                title: 'Experience',
                value: '5 Years',
                icon: Icons.star,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required ThemeData theme,
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              title,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOptions(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profile Options',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildOptionItem(
          context,
          icon: Icons.person,
          title: 'Edit Profile',
          subtitle: 'Update your personal information',
          onTap: () => _showEditProfileDialog(context),
        ),
        _buildOptionItem(
          context,
          icon: Icons.schedule,
          title: 'Availability',
          subtitle: 'Set your working hours',
          onTap: () => _showAvailabilityDialog(context),
        ),
        _buildOptionItem(
          context,
          icon: Icons.attach_money,
          title: 'Pricing',
          subtitle: 'Manage your class rates',
          onTap: () => _showPricingDialog(context),
        ),
        _buildOptionItem(
          context,
          icon: Icons.card_membership,
          title: 'Certifications',
          subtitle: 'Add your qualifications',
          onTap: () => _showCertificationsDialog(context),
        ),
      ],
    );
  }

  Widget _buildAppSettings(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'App Settings',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildOptionItem(
          context,
          icon: Icons.notifications,
          title: 'Notifications',
          subtitle: 'Manage notification preferences',
          onTap: () => _showNotificationSettings(context),
        ),
        _buildOptionItem(
          context,
          icon: Icons.palette,
          title: 'Theme',
          subtitle: 'Change app appearance',
          onTap: () => _showThemeSettings(context),
        ),
        _buildOptionItem(
          context,
          icon: Icons.language,
          title: 'Language',
          subtitle: 'Change app language',
          onTap: () => _showLanguageSettings(context),
        ),
        _buildOptionItem(
          context,
          icon: Icons.help,
          title: 'Help & Support',
          subtitle: 'Get help or contact support',
          onTap: () => _showHelpSupport(context),
        ),
      ],
    );
  }

  Widget _buildLogoutSection(BuildContext context, ThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _buildOptionItem(
          context,
          icon: Icons.privacy_tip,
          title: 'Privacy Policy',
          subtitle: 'Read our privacy policy',
          onTap: () => _showPrivacyPolicy(context),
        ),
        _buildOptionItem(
          context,
          icon: Icons.description,
          title: 'Terms of Service',
          subtitle: 'Read our terms of service',
          onTap: () => _showTermsOfService(context),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _showLogoutDialog(context),
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: theme.primaryColor),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  void _showEditProfileDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Profile'),
        content: const Text('Profile editing functionality will be implemented here.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile editing coming soon!')),
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void _showAvailabilityDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Availability settings coming soon!')),
    );
  }

  void _showPricingDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pricing settings coming soon!')),
    );
  }

  void _showCertificationsDialog(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Certifications management coming soon!')),
    );
  }

  void _showNotificationSettings(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Notification settings coming soon!')),
    );
  }

  void _showThemeSettings(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Theme settings coming soon!')),
    );
  }

  void _showLanguageSettings(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Language settings coming soon!')),
    );
  }

  void _showHelpSupport(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Help & Support coming soon!')),
    );
  }

  void _showPrivacyPolicy(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Privacy Policy coming soon!')),
    );
  }

  void _showTermsOfService(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Terms of Service coming soon!')),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Perform logout
              context.go(AppConstants.loginRoute);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
} 