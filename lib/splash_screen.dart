import 'package:buddy_front/core/theme/theme.dart';
import 'package:buddy_front/features/auth/view/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'bottom_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _startBallAnimation = false;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 1000), () async {
      setState(() {
        _startBallAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ballColor = AppTheme.lightThemeMode.colorScheme.onPrimary;

    return Scaffold(
      backgroundColor: AppTheme.lightThemeMode.primaryColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/icons/friend.svg',
                  width: 200,
                  height: 200,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Buddy',
                  style: AppTheme.labelLargeStyle.copyWith(
                    color: AppTheme.lightThemeMode.colorScheme.onSecondary,
                  ),
                ),
              ],
            ).animate().fadeOut(duration: 850.ms),
            if (_startBallAnimation)
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ballColor,
                ),
              )
                  .animate()
                  .slideY(
                    begin: -8.0,
                    end: 0.0,
                    duration: 800.ms,
                    curve: Curves.bounceOut,
                  )
                  .scale(
                    delay: 800.ms,
                    begin: const Offset(1, 1),
                    end: const Offset(25.0, 25.0),
                    duration: 950.ms,
                    curve: Curves.easeOutCubic,
                  )
                  .callback(
                callback: (controller) {
                  final tokenFuture = _secureStorage.read(key: 'auth_token');
                  tokenFuture.then((token) {
                    if (mounted) {
                      if (token != null && token.isNotEmpty) {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const BottomNavigation(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      }
                    }
                  }).catchError((error) {});
                },
              ),
          ],
        ),
      ),
    );
  }
}
