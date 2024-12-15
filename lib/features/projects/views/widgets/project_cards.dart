import 'dart:io';

import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/theme.dart';
import '../pages/project_details_page.dart';

class ProjectCards extends StatelessWidget {
  final String? text;
  final String? description;
  final String? imagePath;
  final String? tags;
  final String? id;

  const ProjectCards({
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

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetailsPage(projectId: id!),
          ),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          height: 180,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: 120,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: (imagePath != null && imagePath!.isNotEmpty && imagePath != "null")
                        ? (imagePath!.startsWith('http') || imagePath!.startsWith('https'))
                            ? NetworkImage(imagePath!)
                            : FileImage(File(imagePath!))
                        : const AssetImage('assets/images/workshop.jpg') as ImageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      if (tagList.isNotEmpty)
                        Wrap(
                          spacing: 10,
                          children: tagList
                              .map((tag) => Text(
                                    tag,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: _getTagColor(tag),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ))
                              .toList(),
                        ),
                      const SizedBox(height: 8),
                      Text(
                        text ?? 'No Title Available',
                        style: AppTheme.titleMediumStyle.copyWith(
                          color: AppTheme.lightThemeMode.colorScheme.onSecondary,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        description ?? 'No Description Available',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectDetailsPage(projectId: id!),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppPalette.yellowColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Get More Info",
                          style: TextStyle(
                            color: Colors.white,
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
  }
}
