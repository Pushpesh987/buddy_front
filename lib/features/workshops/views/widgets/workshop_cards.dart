import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import '../pages/workshop_details_page.dart';

class WorkshopCards extends StatelessWidget {
  final String? text;
  final String? description;
  final String? imagePath;
  final String? tags;
  final String? id;

  const WorkshopCards({
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
            builder: (context) => WorkshopDetailsPage(workshopId: id!),
          ),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          height: 220,
          child: Row(
            children: [
              if (imagePath != null)
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(imagePath!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              else
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.grey[300],
                  child: Icon(Icons.image, color: Colors.grey[600]),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (tagList.isNotEmpty)
                        Wrap(
                          spacing: 6,
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
                      const SizedBox(height: 6),
                      Text(
                        text ?? 'No Title Available',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
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
                              builder: (context) => WorkshopDetailsPage(workshopId: id!),
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
