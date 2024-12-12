import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'core/theme/app_pallete.dart';
import 'core/theme/theme.dart';
import 'features/chat/view/pages/chat_page.dart';
import 'features/events/view/pages/search_page.dart';
import 'features/profile/view/pages/profile_page.dart';
import 'features/home/view/pages/home_page.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const EventPage(),
    const ChatPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    const selectedIconColor = AppPalette.yellowColor;
    final unselectedIconColor = AppPalette.greyUnselectedItemColor;
    final selectedTextColor = AppPalette.blackSelectedItemColor;
    final unselectedTextColor = AppPalette.greyUnselectedItemColor;

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: selectedIconColor,
        unselectedItemColor: unselectedIconColor,
        selectedLabelStyle:
            AppTheme.lightThemeMode.bottomNavigationBarTheme.selectedLabelStyle!.copyWith(color: selectedTextColor),
        unselectedLabelStyle: AppTheme.lightThemeMode.bottomNavigationBarTheme.unselectedLabelStyle!
            .copyWith(color: unselectedTextColor),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 27,
              height: 27,
              colorFilter: _currentIndex == 0
                  ? ColorFilter.mode(selectedIconColor, BlendMode.srcIn)
                  : ColorFilter.mode(unselectedIconColor, BlendMode.srcIn),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/event.svg',
              width: 26,
              height: 25.13,
              colorFilter: _currentIndex == 1
                  ? ColorFilter.mode(selectedIconColor, BlendMode.srcIn)
                  : ColorFilter.mode(unselectedIconColor, BlendMode.srcIn),
            ),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/chat.svg',
              width: 25,
              height: 25,
              colorFilter: _currentIndex == 2
                  ? ColorFilter.mode(selectedIconColor, BlendMode.srcIn)
                  : ColorFilter.mode(unselectedIconColor, BlendMode.srcIn),
            ),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/profile.svg',
              width: 22,
              height: 25.56,
              colorFilter: _currentIndex == 3
                  ? ColorFilter.mode(selectedIconColor, BlendMode.srcIn)
                  : ColorFilter.mode(unselectedIconColor, BlendMode.srcIn),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
