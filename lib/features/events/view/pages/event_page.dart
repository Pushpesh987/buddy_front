import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';
import '../../../../core/theme/theme.dart';
import '../../../hackathons/views/pages/hackathon_page.dart';
import '../../../projects/views/pages/project_page.dart';
import '../../../workshops/views/pages/workshop_page.dart';

class EventPage extends StatelessWidget {
  final int initialIndex;

  const EventPage({super.key, this.initialIndex = 0});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: initialIndex,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120),
          child: Container(
            padding: const EdgeInsets.only(top: 50.0, left: 28),
            color: AppPalette.whiteColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Events",
                  style: AppTheme.headlineSmallStyle.copyWith(
                    color: AppTheme.lightThemeMode.colorScheme.onSurface,
                  ),
                ),
                const TabBar(
                  indicatorColor: AppPalette.yellowColor,
                  tabs: [
                    Tab(text: "Workshops"),
                    Tab(text: "Hackathons"),
                    Tab(text: "Projects"),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            WorkshopPage(),
            HackathonPage(),
            ProjectPage(),
          ],
        ),
      ),
    );
  }
}
