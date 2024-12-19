import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/profile_model.dart';
import '../widgets/profile_item.dart';

class ProfileDetailsPage extends StatelessWidget {
  final ProfileModel profile;

  const ProfileDetailsPage({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    String formattedDob = _formatDate(profile.dob);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Details"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ProfileItem(label: 'First Name', value: profile.firstName),
            ProfileItem(label: 'Last Name', value: profile.lastName),
            ProfileItem(label: 'Username', value: profile.username),
            ProfileItem(label: 'Age', value: profile.age?.toString()),
            ProfileItem(label: 'Date of Birth', value: formattedDob),
            ProfileItem(label: 'Gender', value: profile.gender),
            ProfileItem(label: 'Phone', value: profile.phone),
            ProfileItem(label: 'Email', value: profile.email),
            ProfileItem(label: 'Location', value: profile.location),
            ProfileItem(label: 'Education Level', value: profile.educationLevel),
            ProfileItem(label: 'Field of Study', value: profile.fieldOfStudy),
            ProfileItem(label: 'College Name', value: profile.collegeName),
            ProfileItem(
              label: 'Skills',
              value: profile.skills?.join(', ') ?? 'Not Available',
            ),
            ProfileItem(
              label: 'Interests',
              value: profile.interests?.join(', ') ?? 'Not Available',
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'Not Available';
    }
    try {
      final DateTime parsedDate = DateTime.parse(date);
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(parsedDate);
    } catch (e) {
      return 'Invalid Date';
    }
  }
}
