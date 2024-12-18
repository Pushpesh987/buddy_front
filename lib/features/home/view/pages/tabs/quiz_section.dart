import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:buddy_front/features/home/view/pages/tabs/quiz/bonus.dart';
import 'package:buddy_front/features/home/view/pages/tabs/quiz/daily.dart';
import 'package:buddy_front/features/home/view/pages/tabs/quiz/skill.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/theme.dart';

class QuizSection extends StatelessWidget {
  const QuizSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DailyPage()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              decoration: BoxDecoration(
                color: AppPalette.yellowColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppPalette.blackColor),
              ),
              child: Text(
                'Daily',
                style: AppTheme.labelLargeStyle.copyWith(
                  color: AppTheme.lightThemeMode.colorScheme.onSecondary,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SkillPage()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              decoration: BoxDecoration(
                color: AppPalette.yellowColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppPalette.blackColor),
              ),
              child: Text(
                'Skill',
                style: AppTheme.labelLargeStyle.copyWith(
                  color: AppTheme.lightThemeMode.colorScheme.onSecondary,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BonusPage()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              decoration: BoxDecoration(
                color: AppPalette.yellowColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppPalette.blackColor),
              ),
              child: Text(
                'Bonus',
                style: AppTheme.labelLargeStyle.copyWith(
                  color: AppTheme.lightThemeMode.colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
