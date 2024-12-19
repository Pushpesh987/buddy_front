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

    // Badge ID to Image Mapping
    final badgeImages = {
      1: 'assets/images/1.png',
      2: 'assets/images/2.png',
      3: 'assets/images/3.png',
      4: 'assets/images/4.png',
      5: 'assets/images/5.png',
      6: 'assets/images/6.png',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: profileState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (profile) {
          final badge = profile.badges?.isNotEmpty == true ? profile.badges!.first : null;
          final badgeImage = badge != null ? badgeImages[badge.badgeId] : null;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile Picture with Badge
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(profile.profilePhotoUrl ?? ''),
                      backgroundColor: Colors.grey.shade200,
                    ),
                    if (badgeImage != null)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          badgeImage,
                          width: 30,
                          height: 30,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),
                // Badge Name
                if (badge != null)
                  Text(
                    badge.badgeName ?? "Unknown Badge",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                const SizedBox(height: 8),
                // User's Name
                Text(
                  '${profile.firstName} ${profile.lastName}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // Username
                Text(
                  '@${profile.username}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Divider(thickness: 1.5, height: 30),
                // View Profile Details Section
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
