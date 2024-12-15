import 'package:buddy_front/features/hackathons/models/hackathon_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodels/hackathon_notifier.dart';

class ProjectDetailsPage extends ConsumerWidget {
  final String projectId;

  const ProjectDetailsPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectDetails = ref.watch(projectNotifierProvider.notifier).fetchProjectDetails(projectId);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Details"),
      ),
      body: FutureBuilder<HackathonModels?>(
        future: projectDetails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: const TextStyle(fontSize: 16, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(
              child: Text(
                "Project details not available.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          }

          // Safely access the data
          final project = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (project.media != null && project.media!.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        project.media!,
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                      ),
                    )
                  else
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Center(
                        child: Text(
                          'No Image Available',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  Text(
                    _validateField(project.title),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _validateField(project.description),
                    style: const TextStyle(fontSize: 16, color: Colors.black, height: 1.5),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Registration deadline (from model)
                          Text(
                            'Registration Deadline: ${_formatDate(project.registrationDeadline)}',
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 12),
                          // Entry Fee
                          Text(
                            'Entry Fee: ₹${project.entryFee ?? 0}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          // Prize Pool
                          Text(
                            'Prize Pool: ₹${project.prizePool ?? 0}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          // Attendees
                          Text(
                            'Attendees: ${project.attendeeCount ?? 0}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          // Theme
                          Text(
                            'Theme: ${_validateField(project.theme)}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Organizer Name: ${_validateField(project.organizerName)}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Organizer Contact: ${_validateField(project.organizerContact)}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Atendee: ${(project.attendeeCount as int)}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Status: ${_validateField(project.status)}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  String _validateField(String? field) {
    if (field == null || field.trim().isEmpty) {
      return 'NA';
    }
    return field;
  }

  String _formatDate(String? date) {
    if (date == null || date.trim().isEmpty) {
      return 'NA';
    }
    try {
      final DateTime parsedDate = DateTime.parse(date);
      return '${parsedDate.year}-${_twoDigits(parsedDate.month)}-${_twoDigits(parsedDate.day)}';
    } catch (e) {
      return 'NA';
    }
  }

  String _twoDigits(int number) {
    return number.toString().padLeft(2, '0');
  }
}
