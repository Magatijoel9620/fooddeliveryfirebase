import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth/auth_service.dart'; // Assuming you have AuthService for logout
import '../themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  // Helper method to show a generic "Not Implemented" dialog
  void _showNotImplementedDialog(BuildContext context, String featureName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(featureName),
        content: const Text("This feature is not yet implemented."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  // Logout method (similar to your drawer)
  void _logout(BuildContext context) {
    final authService = AuthService();
    authService.signOut();
    // Navigate to login or initial page after logout
    // Ensure you handle navigation correctly, perhaps by popping all routes
    // and pushing the login page, or relying on your AuthGate.
    Navigator.of(context).popUntil((route) => route.isFirst); // Example: Pops back to the first route
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        backgroundColor: colorScheme.surfaceContainerHighest, // A bit more elevated color
        elevation: 1,
        foregroundColor: colorScheme.onSurfaceVariant,
      ),
      backgroundColor: colorScheme.surface,
      body: ListView( // Use ListView for scrollability if settings grow
        children: [
          // Section: Appearance
          _buildSectionHeader(context, "Appearance"),
          ListTile(
            leading: Icon(Icons.palette_outlined, color: colorScheme.primary),
            title: Text("Dark Mode", style: TextStyle(color: colorScheme.onSurface)),
            trailing: CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
              activeColor: colorScheme.primary,
            ),
            onTap: () { // Allow tapping the row to toggle as well
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),

          const Divider(height: 1),

          // Section: Account
          _buildSectionHeader(context, "Account"),
          _buildSettingsTile(
            context,
            icon: Icons.person_outline,
            title: "Edit Profile",
            onTap: () => _showNotImplementedDialog(context, "Edit Profile"),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.lock_outline,
            title: "Change Password",
            onTap: () => _showNotImplementedDialog(context, "Change Password"),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.notifications_none_outlined,
            title: "Notification Preferences",
            onTap: () => _showNotImplementedDialog(context, "Notification Preferences"),
          ),

          const Divider(height: 1),

          // Section: About & Support
          _buildSectionHeader(context, "About & Support"),
          _buildSettingsTile(
            context,
            icon: Icons.info_outline,
            title: "About App",
            subtitle: "Version 1.0.0", // Example version
            onTap: () => _showNotImplementedDialog(context, "About App"),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.privacy_tip_outlined,
            title: "Privacy Policy",
            onTap: () => _showNotImplementedDialog(context, "Privacy Policy"),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.gavel_outlined,
            title: "Terms of Service",
            onTap: () => _showNotImplementedDialog(context, "Terms of Service"),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.help_outline,
            title: "Help & Support",
            onTap: () => _showNotImplementedDialog(context, "Help & Support"),
          ),
          _buildSettingsTile(
            context,
            icon: Icons.feedback_outlined,
            title: "Send Feedback",
            onTap: () => _showNotImplementedDialog(context, "Send Feedback"),
          ),

          const Divider(height: 1),

          // Section: Actions
          _buildSectionHeader(context, "Actions"),
          _buildSettingsTile(
            context,
            icon: Icons.logout,
            title: "Logout",
            iconColor: colorScheme.error, // Highlight logout
            textColor: colorScheme.error, // Highlight logout
            onTap: () => _logout(context),
          ),
          // Example of a more destructive action (placeholder)
          // _buildSettingsTile(
          //   context,
          //   icon: Icons.delete_forever_outlined,
          //   title: "Delete Account",
          //   iconColor: colorScheme.error,
          //   textColor: colorScheme.error,
          //   onTap: () => _showNotImplementedDialog(context, "Delete Account"),
          // ),

          const SizedBox(height: 30), // Some padding at the bottom
        ],
      ),
    );
  }

  // Helper widget for section headers
  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0, bottom: 8.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
          fontSize: 13,
          letterSpacing: 0.8,
        ),
      ),
    );
  }

  // Helper widget for creating consistent settings list tiles
  Widget _buildSettingsTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        String? subtitle,
        required VoidCallback onTap,
        Color? iconColor,
        Color? textColor,
      }) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(icon, color: iconColor ?? colorScheme.onSurfaceVariant),
      title: Text(title, style: TextStyle(color: textColor ?? colorScheme.onSurface)),
      subtitle: subtitle != null ? Text(subtitle, style: TextStyle(color: colorScheme.onSurfaceVariant)) : null,
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: colorScheme.onSurfaceVariant),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
    );
  }
}
