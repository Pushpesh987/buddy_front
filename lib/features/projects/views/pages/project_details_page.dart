import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/project_models.dart';
import '../../viewmodels/project_notifier.dart';

class ProjectDetailsPage extends ConsumerWidget {
  final String projectId;

  const ProjectDetailsPage({super.key, required this.projectId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectDetails =
        ref.watch(projectNotifierProvider.notifier).fetchProjectDetails(projectId); // Future<ProjectModels?>

    return Scaffold(
      appBar: AppBar(
        title: const Text("Project Details"),
      ),
      body: FutureBuilder<ProjectModels?>(
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
                          buildInfoRow('Start Date', _formatDate(project.startDate)),
                          buildInfoRow('End Date', _formatDate(project.endDate)),
                          buildInfoRow('Location', _validateField(project.location)),
                          buildInfoRow('Team Members', _validateField(project.teamMembers)),
                          buildInfoRow('Tags', _validateField(project.tags)),
                          buildInfoRow('Sponsors', _validateField(project.sponsors)),
                          buildInfoRow('Goals', _validateField(project.goals)),
                          buildInfoRow('Domain', _validateField(project.domain)),
                          buildInfoRow(
                            'Project Link',
                            project.projectLink != null ? 'View Link' : 'No link available',
                          ),
                          buildInfoRow('Status', _validateField(project.status)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (project.projectLink != null && project.projectLink!.isNotEmpty)
                    GestureDetector(
                      onTap: () async {
                        final Uri url = Uri.parse(project.projectLink!);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url, mode: LaunchMode.externalApplication);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Unable to open the link.")),
                          );
                        }
                      },
                      child: Text(
                        '${project.projectLink!}',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
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

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            '$label:',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
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
