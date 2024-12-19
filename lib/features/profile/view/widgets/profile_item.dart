import 'package:buddy_front/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String label;
  final String? value;
  final bool isImage;

  const ProfileItem({
    super.key,
    required this.label,
    this.value,
    this.isImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppPalette.yellowColor, AppPalette.yellowColorAmberAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 4), // Shadow position
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          leading: Icon(Icons.info_outline, color: AppPalette.blackSelectedItemColor, size: 28),
          title: Text(
            '$label:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: AppPalette.blackColor,
            ),
          ),
          subtitle: isImage
              ? (value != null && value!.isNotEmpty
                  ? CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(value!),
                      backgroundColor: Colors.grey.shade200,
                    )
                  : const Text('No Image Available', style: TextStyle(color: Colors.grey)))
              : Text(
                  value ?? 'Not Available',
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
          trailing: const Icon(Icons.arrow_forward_ios, color: AppPalette.blackColor),
        ),
      ),
    );
  }
}
