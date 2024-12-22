import 'dart:io';

import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../pages/hackathon_details_page.dart';

class HackathonCards extends StatelessWidget {
  final String? text;
  final String? description;
  final String? imagePath;
  final String? tags;
  final String? id;

  const HackathonCards({
    super.key,
    this.text,
    this.description,
    this.imagePath,
    this.tags,
    this.id,
  });

  Color _getTagColor(String tag) {
    switch (tag.toLowerCase()) {
      case 'ml':
        return Colors.red;
      case 'ai':
        return Colors.blueAccent;
      case 'data science':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> tagList = tags?.split(',').map((tag) => tag.trim()).toList() ?? [];

    return LayoutBuilder(
      builder: (context, constraints) {
        final double imageWidth = constraints.maxWidth * 0.3;

        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HackathonDetailsPage(projectId: id!),
              ),
            );
          },
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  // Image Section
                  if (imagePath != null)
                    Container(
                      width: imageWidth,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(16),
                        ),
                        image: DecorationImage(
                          image: (imagePath!.isNotEmpty && imagePath != "null")
                              ? (imagePath!.startsWith('http') || imagePath!.startsWith('https'))
                                  ? NetworkImage(imagePath!)
                                  : FileImage(File(imagePath!))
                              : const AssetImage('assets/images/workshop.jpg') as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  // Details Section
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Tags
                          if (tagList.isNotEmpty)
                            Wrap(
                              spacing: 6,
                              children: tagList
                                  .map((tag) => Text(
                                        tag,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: _getTagColor(tag),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                  .toList(),
                            ),
                          const SizedBox(height: 6),
                          // Title
                          Text(
                            text ?? 'No Title Available',
                            style: AppTheme.titleMediumStyle.copyWith(
                              color: AppTheme.lightThemeMode.colorScheme.onSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 8),
                          // Description
                          Text(
                            description ?? 'No Description Available',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Spacer(),
                          // Button
                          Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HackathonDetailsPage(projectId: id!),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppPalette.yellowColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                              ),
                              child: const Text(
                                "Get More Info",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
