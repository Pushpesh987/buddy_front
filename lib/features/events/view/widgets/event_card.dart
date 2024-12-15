import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String text;
  final String? imagePath;
  final Widget destinationPage;

  const EventCard({
    super.key,
    required this.text,
    this.imagePath,
    required this.destinationPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: SizedBox(
          height: 190,
          child: Stack(
            children: [
              if (imagePath != null)
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      imagePath!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              if (imagePath != null)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppPalette.yellowColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
