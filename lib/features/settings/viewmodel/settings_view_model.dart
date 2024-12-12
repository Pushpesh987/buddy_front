import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:buddy_front/features/auth/view/pages/login_page.dart';

class SettingsViewModel extends StateNotifier<bool> {
  final FlutterSecureStorage secureStorage;

  SettingsViewModel({required this.secureStorage}) : super(false);

  Future<void> logout(BuildContext context) async {
    await secureStorage.delete(key: 'auth_token');

    state = false;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
      (Route<dynamic> route) => false,
    );
  }
}

final settingsViewModelProvider = StateNotifierProvider<SettingsViewModel, bool>((ref) {
  final secureStorage = FlutterSecureStorage();
  return SettingsViewModel(secureStorage: secureStorage);
});
