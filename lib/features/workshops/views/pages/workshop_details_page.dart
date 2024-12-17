import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import this to use Clipboard
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../viewmodel/workshop_notifier.dart';

class WorkshopDetailsPage extends ConsumerWidget {
  final String workshopId;

  const WorkshopDetailsPage({super.key, required this.workshopId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workshopDetails = ref.watch(workshopNotifierProvider.notifier).fetchWorkshopDetails(workshopId);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Workshop Details"),
      ),
      body: FutureBuilder(
        future: workshopDetails,
        builder: (context, AsyncSnapshot workshopSnapshot) {
          if (workshopSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (workshopSnapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${workshopSnapshot.error}",
                style: const TextStyle(fontSize: 16, color: Colors.red),
                textAlign: TextAlign.center,
              ),
            );
          } else if (!workshopSnapshot.hasData || workshopSnapshot.data == null) {
            return const Center(
              child: Text(
                "Workshop details not available.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
          }

          final workshop = workshopSnapshot.data;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (workshop.media != null && workshop.media!.isNotEmpty)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        workshop.media!,
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
                        child: Text('No Image Available', style: TextStyle(fontSize: 16, color: Colors.black54)),
                      ),
                    ),
                  const SizedBox(height: 20),
                  Text(
                    _validateField(workshop.title),
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _validateField(workshop.description),
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
                          buildInfoRow('Date', _formatDate(workshop.date)),
                          buildInfoRow('Location', _validateField(workshop.location)),
                          buildInfoRow('Duration', _formatDuration(workshop.duration)), // Updated line
                          buildInfoRow('Instructor Info', _validateField(workshop.instructorInfo)),
                          buildInfoRow('Tags', _validateField(workshop.tags)),
                          buildInfoRow(
                            'Entry Fee',
                            workshop.entryFee != null ? '\$${workshop.entryFee}' : 'NA',
                          ),
                          buildInfoRow(
                            'Participant Limit',
                            workshop.participantLimit != null ? workshop.participantLimit.toString() : 'NA',
                          ),
                          buildInfoRow('Status', _validateField(workshop.status)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (workshop.registrationLink != null && workshop.registrationLink!.isNotEmpty)
                    Text(
                      "Register: ${workshop.registrationLink!}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  const SizedBox(height: 20),
                  if (workshop.registrationLink != null && workshop.registrationLink!.isNotEmpty)
                    ElevatedButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: workshop.registrationLink!));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Link copied to clipboard")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                      ),
                      child: const Text(
                        'Copy Registration Link',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
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

String _formatDuration(String? duration) {
  if (duration == null || duration.trim().isEmpty) {
    return 'NA';
  }

  try {
    final parts = duration.split(':');
    final hours = int.tryParse(parts[0]);
    final minutes = parts.length > 1 ? int.tryParse(parts[1]) : 0;

    String formattedDuration = '';
    if (hours != null && hours > 0) {
      formattedDuration += '${_twoDigits(hours)} hrs';
    }
    if (minutes != null && minutes > 0) {
      if (formattedDuration.isNotEmpty) {
        formattedDuration += ' ';
      }
      formattedDuration += '${_twoDigits(minutes)} minutes';
    }

    return formattedDuration.isEmpty ? 'NA' : formattedDuration;
  } catch (e) {
    return 'NA';
  }
}

String _twoDigits(int number) {
  return number.toString().padLeft(2, '0');
}
