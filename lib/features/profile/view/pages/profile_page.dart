import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../settings/view/widgets/logout_confirmation_dialog.dart';
import '../../../settings/view/widgets/settings_button.dart';
import '../../../settings/viewmodel/settings_view_model.dart';
import '../../viewmodel/profile_notifier.dart';
import '../widgets/attractive_list_tile.dart';
import 'profile_details_page.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: profileState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (profile) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(profile.profilePhotoUrl ?? ''),
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '${profile.firstName} ${profile.lastName}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '@${profile.username}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Divider(thickness: 1.5, height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileDetailsPage(profile: profile),
                      ),
                    );
                  },
                  child: AttractiveListTile(text: 'View Profile Details'),
                ),
                const SizedBox(height: 16),
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
        },
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
