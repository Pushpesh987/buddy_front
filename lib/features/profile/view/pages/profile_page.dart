import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../settings/view/pages/settings_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/setting.svg',
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                AppPalette.blackSelectedItemColor,
                BlendMode.srcIn,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
