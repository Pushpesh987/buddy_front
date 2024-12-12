import 'package:buddy_front/features/edit_profile/views/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/theme.dart';
import '../../viewmodel/settings_view_model.dart';
import '../widgets/logout_confirmation_dialog.dart';
import '../widgets/settings_button.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingsViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: AppTheme.headlineSmallStyle1.copyWith(
            color: AppTheme.lightThemeMode.colorScheme.onSurface,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle, color: AppTheme.lightThemeMode.primaryColor),
                  title: const Text("Edit Profile"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditProfilePage()),
                    );
                  },
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.lock, color: AppTheme.lightThemeMode.primaryColor),
                  title: const Text("Privacy Settings"),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.notifications, color: AppTheme.lightThemeMode.primaryColor),
                  title: const Text("Notifications"),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.language, color: AppTheme.lightThemeMode.primaryColor),
                  title: const Text("Language Settings"),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.help, color: AppTheme.lightThemeMode.primaryColor),
                  title: const Text("Help & Support"),
                  onTap: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SettingsButton(
              buttonText: "Log Out",
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => LogoutConfirmationDialog(
                    onLogout: () {
                      ref.read(settingsViewModelProvider.notifier).logout(context);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
